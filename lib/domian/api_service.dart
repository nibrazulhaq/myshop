import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_shop/app_config/server_addresses.dart';
import '../screens/dashboard_screen.dart';
import '../screens/login_screen.dart';


enum Method { post, get, put, delete, patch }

class ApiServices {
  ServerAddresses serverAddresses = ServerAddresses();
  header() => {
    'content-type':"application/json",
    'Accept':'application/json',
  };

  Future<dynamic> request({
    String? url,
    Method? method,
    Map<String, dynamic>? params,
  }) async {
    http.Response response;

    try {
      if (method == Method.post) {
        print("BODY PARAM");
        print(jsonEncode(params));
        response = await http.post(Uri.parse(url!),
            body: jsonEncode(params), headers: header());
      }
      // else if (method == Method.delete) {
      //   response = await http.delete(Uri.parse(url),
      //       body: params, headers: removeAuth?null:header(removeAuth,token: token));
      // }
      else if (method == Method.patch) {
        response =
        await http.patch(Uri.parse(url!), body: params, headers: header());
      } else if (method == Method.put) {
        response = await http.put(Uri.parse(url!),
            body: jsonEncode(params), headers: header());
      } else {
        response = await http.get(Uri.parse(url!), headers: header());
      }

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        return response;
      } else if (response.statusCode == 400 || response.statusCode == 404) {
        return response;
      } else if (response.statusCode == 401) {
        throw Exception("Unauthorized");
      } else if (response.statusCode == 500) {
        throw Exception("Server Error");
      } else {
        throw Exception("Something went wrong");
      }
    } on SocketException catch (e) {
      throw Exception("No Internet Connection");
    } on FormatException catch (e) {
      throw Exception("Bad response format");
    } catch (e) {
      throw Exception("Something went wrong");
    }
  }
}
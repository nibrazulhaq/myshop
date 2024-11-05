import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:my_shop/app_config/server_addresses.dart';
import 'package:my_shop/domian/api_service.dart';
class AccountRepository {
  ApiServices httpService = ApiServices();

  login({Map<String, dynamic>? params}) async {
    log('reaching api11');
    try {
      http.Response response = await httpService.request(
          url:'${ServerAddresses.baseUrl}auth/login', method: Method.post,params: params);
      log(response.body);
      return jsonDecode(response.body);
    } catch (e) {
      log('catcher11');
      log(e.toString());
    }
  }




}


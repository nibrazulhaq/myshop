import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../../../app_config/server_addresses.dart';
import '../../../domian/api_service.dart';

class HomeRepository {
  ApiServices httpService = ApiServices();

  getProduct({Map<String, dynamic>? params}) async {
    log('reaching 33');
    try {
      http.Response response = await httpService.request(
          url: '${ServerAddresses.baseUrl}products',method: Method.get);
      log(response.body);
      log('reaching 44');
      return jsonDecode(response.body);
    } catch (e) {
      log('catcher 55');
      log(e.toString());
    }
  }
}
// startTrip({Map<String, dynamic>? params}) async {
//   log('reaching api');
//   try {
//     http.Response response = await httpService.request(
//         url: '${ServerAddresses.baseUrl}customerinfo',
//         method: Method.post,
//         params: params);
//     log(response.body);
//     return jsonDecode(response.body);
//   } catch (e) {
//     log('catcher');
//     log(e.toString());
//   }
// }
//
// endTrip({Map<String, dynamic>? params}) async {
//   log('reaching api');
//   try {
//     http.Response response = await httpService.request(
//         url: '${ServerAddresses.baseUrl}customerupdate',
//         method: Method.put,
//         params: params);
//     log(response.body);
//     return jsonDecode(response.body);
//   } catch (e) {
//     log('catcher');
//     log(e.toString());
//   }
// }
//
// tripDetails({String? uid, String? date}) async {
//   log('reaching api');
//   log('reaching $date');
//   log(date!);
//   try {
//     http.Response response = await httpService.request(
//         url: '${ServerAddresses.baseUrl}trip/$uid?date=$date',
//         method: Method.get);
//     log(response.body);
//     return jsonDecode(response.body);
//   } catch (e) {
//     log('catcher');
//     log(e.toString());
//   }
// }
//
// postLocation({Map<String, dynamic>? params}) async {
//   try {
//     http.Response response = await httpService.request(
//         url: '${ServerAddresses.baseUrl}postlive',
//         method: Method.post,
//         params: params);
//     return jsonDecode(response.body);
//   } catch (e) {
//     log(e.toString());
//   }
// }
//
// tripFare({String? model, String? rideTime, String? distance}) async {
//   log('reaching api');
//   try {
//     http.Response response = await httpService.request(
//         url:
//         '${ServerAddresses.baseUrl}getfares?model=$model&rideTime=$rideTime&distance=$distance',
//         method: Method.get);
//     log(response.body);
//     return jsonDecode(response.body);
//   } catch (e) {
//     log('catcher');
//     log(e.toString());
//   }
// }
//
// addSession({Map<String, dynamic>? params}) async {
//   try {
//     http.Response response = await httpService.request(
//         url: '${ServerAddresses.baseUrl}session/add',
//         method: Method.post,
//         params: params);
//     return jsonDecode(response.body);
//   } catch (e) {
//     log(e.toString());
//   }
// }

//
// removeSession({Map<String, dynamic>? params}) async {
//   try {
//     http.Response response = await httpService.request(
//         url: '${ServerAddresses.baseUrl}session/remove',
//         method: Method.post,
//         params: params);
//     return jsonDecode(response.body);
//   } catch (e) {
//     log(e.toString());
//   }
// }
//
// advanceBookingDetails({String? uid}) async {
//   try {
//     http.Response response = await httpService.request(
//         url: '${ServerAddresses.baseUrl}advance/$uid',
//         method: Method.get);
//     log(response.body);
//     return jsonDecode(response.body);
//   } catch (e) {
//     log(e.toString());
//   }
// }
//
// //Send SMS
// sendSMS({Map<String, dynamic>? params}) async {
//   log(params.toString());
//   try {
//     http.Response response = await httpService.request(
//         url: '${ServerAddresses.baseUrl}sms',
//         method: Method.post,
//         params: params);
//     return jsonDecode(response.body);
//   } catch (e) {
//     log(e.toString());
//   }
// }
//
// saveAdvanceBooking({Map<String, dynamic>? params}) async {
//   log(params.toString());
//   try {
//     http.Response response = await httpService.request(
//         url: '${ServerAddresses.baseUrl}advance',
//         method: Method.post,
//         params: params);
//     return jsonDecode(response.body);
//   } catch (e) {
//
//     log(e.toString());
//   }
// }
//
// updateAdvanceBooking({Map<String, dynamic>? params , String? uid}) async {
//   log('reaching');
//   log(params.toString());
//   try {
//     http.Response response = await httpService.request(
//         url: '${ServerAddresses.baseUrl}advance/$uid',
//         method: Method.put,
//         params: params);
//     return jsonDecode(response.body);
//   } catch (e) {
//     log(e.toString());
//   }
// }

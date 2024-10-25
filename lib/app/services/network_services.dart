import 'dart:convert';
import 'package:http/http.dart';
import 'package:task_next_x/app/models/entities/network_response.dart';
import 'package:task_next_x/app/services/logger_service.dart';
import 'package:task_next_x/data/local/auth_controller_services.dart';
import 'package:task_next_x/resources/constants/routes/routes_name.dart';
import 'package:get/get.dart' as getx;

class NetworkServices {
  final LoggerService loggerService;

  NetworkServices({required this.loggerService});

  Future<NetworkResponse> getRequest(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      loggerService.requestLog(url, {}, {}, "");
      final Response response = await get(
        uri,
        headers: {
          'token': AuthControllerServices.accessToken,
        },
      );

      if (response.statusCode == 200) {
        loggerService.responseLog(
          url,
          response.statusCode,
          response.body,
          response.headers,
          true,
        );
        final decodedBody = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseBody: decodedBody,
        );
      } else if (response.statusCode == 401) {
        _redirectToSignIn();
        loggerService.responseLog(
          url,
          response.statusCode,
          response.body,
          response.headers,
          false,
        );

        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      } else {
        loggerService.responseLog(
          url,
          response.statusCode,
          response.body,
          response.headers,
          false,
        );
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      loggerService.responseLog(url, -1, null, {}, false, e);
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> postRequest(String url,
      {Map<String, dynamic>? body}) async {
    try {
      final Uri uri = Uri.parse(url);
      loggerService.requestLog(url, {}, body ?? {}, "");
      final Response response =
          await post(uri, body: jsonEncode(body), headers: {
        'Content-type': 'Application/json',
        'token': AuthControllerServices.accessToken,
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        loggerService.responseLog(
          url,
          response.statusCode,
          response.body,
          response.headers,
          true,
        );
        final decodedBody = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseBody: decodedBody,
        );
      } else if (response.statusCode == 401) {
        _redirectToSignIn();
        loggerService.responseLog(
          url,
          response.statusCode,
          response.body,
          response.headers,
          false,
        );
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      } else {
        loggerService.responseLog(
          url,
          response.statusCode,
          response.body,
          response.headers,
          false,
        );
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      loggerService.responseLog(url, -1, null, {}, false, e);
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }


  Future<void> _redirectToSignIn() async{
    await AuthControllerServices.clearAllData();
    getx.Get.offAll(RoutesName.signInView);
  }

}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:load_connect/backend/models/core/api_response.dart';
import 'package:load_connect/backend/services/core/i_local_storage.dart';
import 'package:load_connect/shared/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {

  static final _apiService = ApiService.createInstance();
  ApiService.createInstance();

  Dio dio = Dio();

  factory ApiService() {
    print("DioLoggerAdded: ");
    _apiService.dio.interceptors.add(PrettyDioLogger(
      requestBody: true, responseBody: true, error: true, requestHeader: true,
      compact: true,
    ));
    _apiService.dio.interceptors.add(TokenInterceptor());
    return _apiService;
  }

  Future<ApiResponse> makePostRequest(url, data, headers, {useFormData = false}) async {
    try {
      return await dio.post(url, data: useFormData ? FormData.fromMap(data) : data, options: Options(
          headers: {
            ...(headers ?? {}),
            ...(await _getHeader())
          },
          responseType: ResponseType.json
      )).then((value) {
        if (value.data['status'] == "success") {
          return ApiResponse(
            status: true, data: value.data, message: value.statusMessage!
          );
        } else {
          return _handleError2(value.data['message']);
        }
      });
    } on DioError catch(error) {
      return _handleError(error);
    } catch (error) {
      print("Error: $error FROM $url");
      return ApiResponse(
        status: false, data: null, message: "Error"
      );
    }
  }

  Future<ApiResponse> makePutRequest(url, data, headers, {useFormData = false}) async {
    try {
      return await dio.put(url, data: useFormData ? FormData.fromMap(data) : data, options: Options(
          headers: {
            ...(headers ?? {}),
            ...(await _getHeader())
          },
          responseType: ResponseType.json
      )).then((value) {
        if (value.data['status'] == "success") {
          return ApiResponse(
            status: true, data: value.data, message: value.statusMessage!
          );
        } else {
          return _handleError2(value.data['message']);
        }
      });
    } on DioError catch(error) {
      return _handleError(error);
    } catch (error) {
      print("Error: $error FROM $url");
      return ApiResponse(
        status: false, data: null, message: "Error"
      );
    }
  }

  Future<ApiResponse> makePatchRequest(url, data, headers, {useFormData = false}) async {
    try {
      return await dio.patch(url, data: useFormData ? FormData.fromMap(data) : data, options: Options(
          headers: {
            ...(headers ?? {}),
            ...(await _getHeader())
          },
          responseType: ResponseType.json
      )).then((value) {
        debugPrint("PATCH ::: $url ::: ${value.data}");
        if (value.data['status'] == "success") {
          return ApiResponse(
            status: true, data: value.data, message: value.statusMessage!
          );
        } else {
          return _handleError2(value.data['message']);
        }
      });
    } on DioError catch(error) {
      return _handleError(error);
    } catch (error) {
      // print("Error: $error FROM $url");
      // rethrow;
      return ApiResponse(
        status: false, data: null, message: "Error: $error"
      );
    }
  }

  Future<ApiResponse> makeGetRequest(url, headers) async {
    try {
      return await dio.get(url, options: Options(
          headers: {
            ...(headers ?? {}),
            ...(await _getHeader())
          },
          responseType: ResponseType.json
      )).then((value) {
        if (value.data['status'] == "success") {
          return ApiResponse(
            status: true, data: value.data, message: value.statusMessage!
          );
        } else {
          return _handleError2(value.data['message']);
        }
      });
    } on DioError catch (error) {
      return _handleError(error);
    } catch (error) {
      print("Error: $error FROM $url");
      return ApiResponse(
        status: false, data: null, message: "Error"
      );
    }

  }

  Future _getHeader() async {
    var token = await Get.find<ILocalStorageService>().getItem(userDataBox, userTokenKey, defaultValue: "");
    return {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
  }

  ApiResponse _handleError(DioError error) {
    print(error.response);
    if (error.response == null) {
      return ApiResponse(
        status: false, data: null, message: 'Internet connection error'
      );
    }
    if (error.response!.statusCode == 422) {
      return ApiResponse(
        status: false, data: null, message: error.response!.data['message']
      );
    }
    if (error.response!.statusCode == 500) {
      return ApiResponse(
        status: false, data: null, message: 'Internet connection error'
      );
    }
    // print("========== Error Start ==========");
    // var message = '${error.response!.data['error'] ?? error.response!.data['message'] ?? "Internet Error occurred"}';
    var message = '${error.response!.data['error'] ?? error.response!.data['message'] ?? "Internet Error occurred"}';
    // print(error.response!.statusCode);
    // print("========== Error End ==========");
    return ApiResponse(
      status: false, data: null, message: message
    );
  }
  ApiResponse _handleError2(error) {
    if (error.runtimeType == String) {
      return ApiResponse(
          status: false, data: null, message: error
      );
    }
    final errorData = error;
    print(errorData);
    var errors = '';
    errorData.forEach((key, value) {
      final List err = List.from(value);
      errors += err.join('\n');
    });
    return ApiResponse(
      status: false, data: null, message: errors
    );
  }
}


class TokenInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    debugPrint("TokenInterceptor:::OnRequest");
    /// check for token requirement
    if (options.headers.containsKey('requireToken')) {
      options.headers.remove("requiresToken");
      if (options.headers['requireToken'] == true) {
        final token = await Get.find<ILocalStorageService>().getItem(userDataBox, userTokenKey);
        // if (token == null) {
        //   final error = DioError(requestOptions: options, error: "Unauthenticated");
        //   super.onError(error, handler);
        // }
        options.headers['Authorization'] = "$token";
      }
    }
    // return options;
    super.onRequest(options, handler);
  }

}
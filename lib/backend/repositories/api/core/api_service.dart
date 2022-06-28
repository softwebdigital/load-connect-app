import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:load_connect/backend/models/core/api_response.dart';
import 'package:load_connect/backend/services/core/i_local_storage.dart';
import 'package:load_connect/shared/constants.dart';

class ApiService {

  static final _apiService = ApiService.createInstance();
  ApiService.createInstance();

  Dio dio = Dio();

  factory ApiService() {
    // _apiService.dio.interceptors.add(PrettyDioLogger(
    //   requestBody: true, responseBody: true, error: true, requestHeader: true,
    //   compact: true,
    // ));
    return _apiService;
  }

  Future<ApiResponse> makePostRequest(url, data, headers, {useFormData = false}) async {
    try {
      return await dio.post(url, data: useFormData ? FormData.fromMap(data) : data, options: Options(
          headers: headers ?? await _getHeader(),
          responseType: ResponseType.json
      )).then((value) {
        if (value.data['status'] == true) {
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
          headers: headers ?? await _getHeader(),
          responseType: ResponseType.json
      )).then((value) {
        debugPrint("PATCH ::: $url ::: ${value.data}");
        if (value.data['status'] == true || value.data['data'] != null) {
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
      rethrow;
      return ApiResponse(
        status: false, data: null, message: "Error"
      );
    }
  }

  Future<ApiResponse> makeGetRequest(url, headers) async {
    try {
      return await dio.get(url, options: Options(
          headers: headers ?? await _getHeader(),
          responseType: ResponseType.json
      )).then((value) {
        if (value.data['status'] == true) {
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
      final errorData = Map.from(error.response!.data);
      print(errorData);
      var errors = '';
      errorData.forEach((key, value) {
        final List err = List.from(value);
        errors += err.join('\n');
      });
      // print(errors);
      // return ApiResponse.fromJSON({
      //   'status': false, 'data': null,
      //   'message': errors
      //   // 'message': 'Network error, please try again'
      // });
      return ApiResponse(
        status: false, data: null, message: errors
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
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pay_wallet/core/api_exceptions/base_response.dart';

class AppException implements Exception {
  static BaseResponse<T> handleError<T>(
    DioException e, {
    T? data,
  }) {
    log(e.toString());
    if (e.response != null && DioExceptionType.badResponse == e.type) {
      if (e.response!.statusCode! >= 500) {
        if (e.response?.data is Map<String, dynamic>) {
          log(BaseResponse.fromMap(e.response?.data).message.toString());
          return BaseResponse(
            status: false,
            message: e.response?.data["message"],
          );
        }
        return BaseResponse(
          status: false,
          message: 'Server Error',
          data: data,
        );
      }
      if (e.response!.statusCode! == 413) throw 'File too large';

      if (e.response?.data is Map<String, dynamic>) {
        log(BaseResponse.fromMap(e.response?.data).message.toString());
        return BaseResponse.fromMap(e.response?.data);
      } else if (e.response?.data is String) {
        log(e.response?.data);
        return throw 'Something went wrong';
      }
    }
    return BaseResponse(
      status: false,
      data: data,
      message: _mapException(e.type),
    );
  }

  static String _mapException(DioExceptionType? error) {
    if (DioExceptionType.connectionTimeout == error ||
        DioExceptionType.receiveTimeout == error ||
        DioExceptionType.sendTimeout == error) {
      return 'Timeout Exception';
    } else if (DioExceptionType.unknown == error) {
      return 'Please check your internet connection';
    }
    return 'Something Went wrong';
  }
}

import 'package:desktop_tools_flutter/core/error/app_error.dart';
import 'package:dio/dio.dart';

class ErrorMessage {
  static AppError fromException(Object error) {
    if (error is AppError) {
      return error;
    }
    if (error is DioException) {
      return AppError(
        type: AppErrorType.network,
        message: '网络请求失败，请稍后重试',
        original: error,
      );
    }
    return AppError(
      type: AppErrorType.unknown,
      message: '发生未知错误，请重试',
      original: error,
    );
  }
}


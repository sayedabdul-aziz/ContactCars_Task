import 'dart:developer';
import 'dart:io';

import 'package:contactcars_task/core/services/failures/failure_model.dart';
import 'package:dio/dio.dart';

import 'failure.dart';

class ServerFailureDio extends Failure {
  ServerFailureDio(
      {required super.exceptionType,
      super.statusCode,
      required super.expMsgCode,
      super.errorMessage});

/*
 * this factory constructor using to decide which factory constructor will using to will return an instance of class based on dio exception
*/
  factory ServerFailureDio.handleNetworkErrorType(DioException exception) {
    log("Exception : ${exception.response!.data}");
    FailureModel failureModel = FailureModel.fromJson(exception.response!.data);
    log("failureModel : ${failureModel.message}");

    final expType = exception.type;

    if (expType == DioExceptionType.badResponse) {
      return ServerFailureDio.fromResponse(exception);
    }
    if (expType is NetworkTimeoutExceptions) {
      return ServerFailureDio.fromTimeout(exception);
    }
    if (exception.error is SocketException ||
        expType == DioExceptionType.connectionError) {
      return ServerFailureDio.fromNetwork(exception);
    }
    return ServerFailureDio.fromUnknown(exception);
  }

  factory ServerFailureDio.fromResponse(DioException exception) {
    return ServerFailureDio(
      exceptionType: DioExceptionType.badResponse,
      statusCode: exception.response?.statusCode,
      expMsgCode: NetworkExpMsgCodes.badResponseExpCode,
      errorMessage: (exception.response?.data is Map)
          ? exception.response?.data['message'].toString()
          : "",
    );
  }

  factory ServerFailureDio.fromNetwork(DioException exception) {
    return ServerFailureDio(
      exceptionType: DioExceptionType.connectionError,
      statusCode: exception.response?.statusCode,
      expMsgCode: NetworkExpMsgCodes.noInternetConnectionExpCode,
      errorMessage: exception.response?.data['message'].toString(),
    );
  }

  factory ServerFailureDio.fromUnknown(DioException exception) {
    return ServerFailureDio(
      exceptionType: DioExceptionType.unknown,
      statusCode: exception.response?.statusCode,
      expMsgCode: NetworkExpMsgCodes.unKnowingExpCode,
      errorMessage: exception.response?.data['message'].toString(),
    );
  }

  factory ServerFailureDio.fromTimeout(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.receiveTimeout:
        return ServerFailureDio(
          exceptionType: DioExceptionType.receiveTimeout,
          statusCode: exception.response?.statusCode,
          expMsgCode: NetworkExpMsgCodes.noInternetConnectionExpCode,
          errorMessage: exception.response?.data['message'].toString(),
        );
      case DioExceptionType.sendTimeout:
        return ServerFailureDio(
          exceptionType: DioExceptionType.sendTimeout,
          statusCode: exception.response?.statusCode,
          expMsgCode: NetworkExpMsgCodes.noInternetConnectionExpCode,
          errorMessage: exception.response?.data['message'].toString(),
        );
      case DioExceptionType.connectionTimeout:
        return ServerFailureDio(
          exceptionType: DioExceptionType.connectionTimeout,
          statusCode: exception.response?.statusCode,
          expMsgCode: NetworkExpMsgCodes.noInternetConnectionExpCode,
          errorMessage: exception.response?.data['message'].toString(),
        );
      case DioExceptionType.cancel:
        return ServerFailureDio(
          exceptionType: DioExceptionType.cancel,
          statusCode: exception.response?.statusCode,
          expMsgCode: NetworkExpMsgCodes.noInternetConnectionExpCode,
          errorMessage: exception.response?.data['message'].toString(),
        );
      default:
        return ServerFailureDio.fromUnknown(exception);
    }
  }
}

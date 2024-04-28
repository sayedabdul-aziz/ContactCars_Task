import 'package:contactcars_task/core/services/failures/failure.dart';
import 'package:contactcars_task/core/services/failures/server_failure_dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Failure handleError(Object e) {
  if (e is DioException) {
    return ServerFailureDio.handleNetworkErrorType(e);
  }
  return ServerFailureDio(
    exceptionType: DioExceptionType.unknown,
    expMsgCode: NetworkExpMsgCodes.unKnowingExpCode,
    errorMessage: e.toString(),
  );
}

String mapFailureToMessage(Failure? failure, BuildContext context) {
  if (failure != null) {
    switch (failure.exceptionType) {
      case NetworkExpMsgCodes.noInternetConnectionExpCode:
        return 'No Internet Connection';
      case FirebaseExceptions.invalidPhoneNumber:
        return 'Invalid Phone Number';
      case FirebaseExceptions.invalidVerificationCode:
        return 'Invalid Verification Code';

      case FirebaseExceptions.sessionExpired:
        return 'Your session has expired. Please try again.';
      default:
        return (failure.errorMessage != null &&
                failure.errorMessage!.isNotEmpty)
            ? failure.errorMessage!
            : 'Unknown Error';
    }
  }
  return 'Unknown Error';
}

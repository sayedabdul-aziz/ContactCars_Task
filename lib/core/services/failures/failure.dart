enum NetworkTimeoutExceptions {
  sendTimeout,
  connectionTimeout,
  receiveTimeout,
  cancel,
}

enum NetworkExpMsgCodes {
  noInternetConnectionExpCode,
  badResponseExpCode,
  unKnowingExpCode
}

enum FirebaseExceptions {
  userNotFoundExpCode,
  wrongPasswordExpCode,
  userDisabledExpCode,
  unknowingExpCode,
  weakPassword,
  emailAlreadyInUse,
  invalidPhoneNumber,
  invalidVerificationCode,
  invalidVerificationId,
  sessionExpired,
}

class Failure {
  final dynamic exceptionType;
  final String? errorMessage;
  final int? statusCode;
  final NetworkExpMsgCodes? expMsgCode;
  const Failure({
    required this.exceptionType,
    this.errorMessage,
    this.statusCode,
    this.expMsgCode,
  });
}

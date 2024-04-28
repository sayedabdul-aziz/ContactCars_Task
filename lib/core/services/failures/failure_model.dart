class FailureModel {
  bool? result;
  String? message;
  dynamic user;

  FailureModel({this.result, this.message, this.user});

  factory FailureModel.fromJson(Map<String, dynamic>? json) => FailureModel(
        result: json?['result'] as bool?,
        message: json?['message'] as String?,
        user: json?['user'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'result': result,
        'message': message,
        'user': user,
      };
}

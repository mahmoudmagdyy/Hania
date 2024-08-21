import '../../domain/entities/update_email_verify_code_response.dart';

class UpdateEmailVerifyCodeModel extends UpdateEmailVerifyCodeResponse {
  const UpdateEmailVerifyCodeModel({
    required super.success,
    required super.message,
  });

  factory UpdateEmailVerifyCodeModel.fromJson(Map<String, dynamic> json) =>
      UpdateEmailVerifyCodeModel(
        success: json['success'],
        message: json['message'],
      );
}

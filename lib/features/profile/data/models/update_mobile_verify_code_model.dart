import '../../domain/entities/update_mobile_verify_code_response.dart';

class UpdateMobileVerifyCodeModel extends UpdateMobileVerifyCodeResponse {
  const UpdateMobileVerifyCodeModel({
    required super.success,
    required super.message,
  });

  factory UpdateMobileVerifyCodeModel.fromJson(Map<String, dynamic> json) =>
      UpdateMobileVerifyCodeModel(
        success: json['success'],
        message: json['message'],
      );
}


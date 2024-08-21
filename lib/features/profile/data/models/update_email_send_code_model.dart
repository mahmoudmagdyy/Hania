import '../../domain/entities/update_email_send_code_response.dart';

class UpdateEmailSendCodeModel extends UpdateEmailSendCodeResponse {
  const UpdateEmailSendCodeModel({
    required super.success,
    required super.message,
  });

  factory UpdateEmailSendCodeModel.fromJson(Map<String, dynamic> json) =>
      UpdateEmailSendCodeModel(
        success: json['success'],
        message: json['message'],
      );
}




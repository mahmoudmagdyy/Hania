import '../../domain/entities/update_mobile_send_code_response.dart';

class UpdateMobileSendCodeModel extends UpdateMobileSendCodeResponse {
  const UpdateMobileSendCodeModel({
    required super.success,
    required super.message,
    required super.newMobile,
  });

  factory UpdateMobileSendCodeModel.fromJson(Map<String, dynamic> json) =>
      UpdateMobileSendCodeModel(
        success: json['success'],
        message: json['message'],
        newMobile: json['data']?['new_mobile']?.toString() ?? '',
      );
}




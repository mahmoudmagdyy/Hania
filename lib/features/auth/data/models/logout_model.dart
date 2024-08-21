import '../../domain/entities/logout_response.dart';

class LogoutModel extends LogoutResponse {
  const LogoutModel({
    required super.success,
    required super.message,
  });

  factory LogoutModel.fromJson(Map<String, dynamic> json) =>
      LogoutModel(
        success: json['success'],
        message: json['message'],
      );
}




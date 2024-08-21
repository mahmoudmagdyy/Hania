import '../../domain/entities/read_notification_response.dart';

class ReadNotificationModel extends ReadNotificationResponse {
  const ReadNotificationModel({
    required super.success,
    required super.message,
  });

  factory ReadNotificationModel.fromJson(Map<String, dynamic> json) =>
      ReadNotificationModel(
        success: json['success'],
        message: json['message'],
      );
}




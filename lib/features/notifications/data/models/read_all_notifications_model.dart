import '../../domain/entities/read_all_notifications_response.dart';

class ReadAllNotificationsModel extends ReadAllNotificationsResponse {
  const ReadAllNotificationsModel({
    required super.success,
    required super.message,
  });

  factory ReadAllNotificationsModel.fromJson(Map<String, dynamic> json) =>
      ReadAllNotificationsModel(
        success: json['success'],
        message: json['message'],
      );
}




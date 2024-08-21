import '../../domain/entities/get_notifications_response.dart';

class GetNotificationsModel extends GetNotificationsResponse {
  const GetNotificationsModel({
    required super.success,
    required super.message,
    required super.data,
  });

  factory GetNotificationsModel.fromJson(Map<String, dynamic> json) =>
      GetNotificationsModel(
        success: json['success'],
        message: json['message'],
        data: (json['data'] as List<dynamic>)
            .map((dynamic e) => NotificationDataModel.fromJson(e))
            .toList(),
      );
}


class NotificationDataModel extends NotificationData {
  const NotificationDataModel({
    required super.id,
    required super.type,
    required super.title,
    required super.message,
    required super.readAt,
    required super.createdAt,
  });

  factory NotificationDataModel.fromJson(Map<String, dynamic> json) => NotificationDataModel(
    id: json['id'] ?? '',
    type: json['type'] ?? '',
    title: json['title'] ?? '',
    message: json['message'] ?? '',
    readAt: json['read_at'] ?? '',
    createdAt: json['created_at'] ?? '',
  );

}




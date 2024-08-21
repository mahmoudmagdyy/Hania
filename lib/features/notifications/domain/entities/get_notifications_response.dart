import 'package:equatable/equatable.dart';

class GetNotificationsResponse extends Equatable{
  final bool success;
  final String message;
  final List<NotificationData> data;

  const GetNotificationsResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  @override
  List<Object?> get props => <Object?>[
    success,
    message,
    data,
  ];
}


class NotificationData extends Equatable {
  final String id;
  final String type;
  final String title;
  final String message;
  final String readAt;
  final String createdAt;

  const NotificationData({
    required this.id,
    required this.type,
    required this.title,
    required this.message,
    required this.readAt,
    required this.createdAt,
  });

  NotificationData copyWith({
    String? id,
    String? type,
    String? title,
    String? message,
    String? readAt,
    String? createdAt,
  }) {
    return NotificationData(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      message: message ?? this.message,
      readAt: readAt ?? this.readAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    id,
    type,
    title,
    message,
    readAt,
    createdAt,
  ];

}

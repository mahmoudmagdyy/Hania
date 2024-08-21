import 'package:equatable/equatable.dart';

class ReadAllNotificationsResponse extends Equatable{
  final bool success;
  final String message;

  const ReadAllNotificationsResponse({
    required this.success,
    required this.message,
  });

  @override
  List<Object?> get props => <Object?>[
    success,
    message,
  ];
}




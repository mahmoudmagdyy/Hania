import 'package:equatable/equatable.dart';

class ReadNotificationResponse extends Equatable{
  final bool success;
  final String message;

  const ReadNotificationResponse({
    required this.success,
    required this.message,
  });

  @override
  List<Object?> get props => <Object?>[
    success,
    message,
  ];
}




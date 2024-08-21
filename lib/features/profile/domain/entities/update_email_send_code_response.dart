import 'package:equatable/equatable.dart';

class UpdateEmailSendCodeResponse extends Equatable{
  final bool success;
  final String message;

  const UpdateEmailSendCodeResponse({
    required this.success,
    required this.message,
  });

  @override
  List<Object?> get props => <Object?>[
    success,
    message,
  ];
}




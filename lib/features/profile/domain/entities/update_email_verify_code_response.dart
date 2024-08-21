import 'package:equatable/equatable.dart';

class UpdateEmailVerifyCodeResponse extends Equatable{
  final bool success;
  final String message;

  const UpdateEmailVerifyCodeResponse({
    required this.success,
    required this.message,
  });

  @override
  List<Object?> get props => <Object?>[
    success,
    message,
  ];
}
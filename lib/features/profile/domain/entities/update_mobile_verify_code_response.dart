import 'package:equatable/equatable.dart';


class UpdateMobileVerifyCodeResponse extends Equatable{
  final bool success;
  final String message;

  const UpdateMobileVerifyCodeResponse({
    required this.success,
    required this.message,
  });

  @override
  List<Object?> get props => <Object?>[
    success,
    message,
  ];
}

import 'package:equatable/equatable.dart';

class UpdateMobileSendCodeResponse extends Equatable{
  final bool success;
  final String message;
  final String newMobile;

  const UpdateMobileSendCodeResponse({
    required this.success,
    required this.message,
    required this.newMobile,
  });

  @override
  List<Object?> get props => <Object?>[
    success,
    message,
    newMobile,
  ];
}




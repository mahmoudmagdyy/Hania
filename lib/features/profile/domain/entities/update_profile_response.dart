import 'package:equatable/equatable.dart';

class UpdateProfileResponse extends Equatable{
  final bool success;
  final String message;

  const UpdateProfileResponse({
    required this.success,
    required this.message,
  });

  @override
  List<Object?> get props => <Object?>[
    success,
    message,
  ];
}


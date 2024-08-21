import 'package:equatable/equatable.dart';

class UpdateDoctorTitleResponse extends Equatable{
  final bool success;
  final String message;

  const UpdateDoctorTitleResponse({
    required this.success,
    required this.message,
  });

  @override
  List<Object?> get props => <Object?>[
    success,
    message,
  ];
}




import 'package:equatable/equatable.dart';

class EditBioResponse extends Equatable{
  final bool success;
  final String message;

  const EditBioResponse({
    required this.success,
    required this.message,
  });

  @override
  List<Object?> get props => <Object?>[
    success,
    message,
  ];
}




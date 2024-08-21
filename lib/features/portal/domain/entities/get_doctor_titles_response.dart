import 'package:equatable/equatable.dart';

class GetDoctorTitlesResponse extends Equatable{
  final bool success;
  final String message;
  final List<DoctorTitle> data;

  const GetDoctorTitlesResponse({
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


class DoctorTitle extends Equatable {
  final int id;
  final String title;

  const DoctorTitle({
    required this.id,
    required this.title,
  });

  DoctorTitle copyWith({
    int? id,
    String? title,
  }) {
    return DoctorTitle(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    id,
    title,
  ];

}



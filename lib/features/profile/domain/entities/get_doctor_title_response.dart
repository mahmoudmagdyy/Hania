import 'package:equatable/equatable.dart';

import '../../../portal/domain/entities/get_doctor_titles_response.dart';

class GetDoctorTitleResponse extends Equatable{
  final bool success;
  final String message;
  final GetDoctorTitleResponseData data;

  const GetDoctorTitleResponse({
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

class GetDoctorTitleResponseData extends Equatable{
  final DoctorTitle doctorTitle;
  final String practiceCertificateUrl;

  const GetDoctorTitleResponseData({
    required this.doctorTitle,
    required this.practiceCertificateUrl,
  });

  @override
  List<Object?> get props => <Object?>[
    doctorTitle,
    practiceCertificateUrl,
  ];
}

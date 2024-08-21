import '../../../portal/data/models/get_doctor_titles_model.dart';
import '../../domain/entities/get_doctor_title_response.dart';

class GetDoctorTitleModel extends GetDoctorTitleResponse {
  const GetDoctorTitleModel({
    required super.success,
    required super.message,
    required super.data,
  });

  factory GetDoctorTitleModel.fromJson(Map<String, dynamic> json) =>
      GetDoctorTitleModel(
        success: json['success'],
        message: json['message'],
        data: GetDoctorTitleResponseDataModel.fromJson(json['data']),
      );
}

class GetDoctorTitleResponseDataModel extends GetDoctorTitleResponseData {
  const GetDoctorTitleResponseDataModel({
    required super.doctorTitle,
    required super.practiceCertificateUrl,
  });

  factory GetDoctorTitleResponseDataModel.fromJson(Map<String, dynamic> json) =>
      GetDoctorTitleResponseDataModel(
        doctorTitle: DoctorTitleModel.fromJson(json['title']),
        // practiceCertificateUrl: json['files'][0]['original_url'],
        practiceCertificateUrl: '',
      );
}
import '../../domain/entities/update_doctor_title_response.dart';

class UpdateDoctorTitleModel extends UpdateDoctorTitleResponse {
  const UpdateDoctorTitleModel({
    required super.success,
    required super.message,
  });

  factory UpdateDoctorTitleModel.fromJson(Map<String, dynamic> json) =>
      UpdateDoctorTitleModel(
        success: json['success'],
        message: json['message'],
      );
}




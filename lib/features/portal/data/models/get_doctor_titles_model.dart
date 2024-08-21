import '../../domain/entities/get_doctor_titles_response.dart';

class GetDoctorTitlesModel extends GetDoctorTitlesResponse {
  const GetDoctorTitlesModel({
    required super.success,
    required super.message,
    required super.data,
  });

  factory GetDoctorTitlesModel.fromJson(Map<String, dynamic> json) =>
      GetDoctorTitlesModel(
        success: json['success'],
        message: json['message'],
        data: (json['data'] as List<dynamic>)
            .map((dynamic e) => DoctorTitleModel.fromJson(e))
            .toList(),
      );
}


class DoctorTitleModel extends DoctorTitle {
  const DoctorTitleModel({
    required super.id,
    required super.title,
  });

  factory DoctorTitleModel.fromJson(Map<String, dynamic> json) => DoctorTitleModel(
    id: json['id'] != null? num.tryParse(json['id'].toString())?.toInt()?? 0: 0,
    title: json['title'] ?? '',
  );

}




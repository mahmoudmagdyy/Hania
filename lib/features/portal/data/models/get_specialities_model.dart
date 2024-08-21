import '../../domain/entities/get_specialities_response.dart';

// class GetSpecialitiesModel extends GetSpecialitiesResponse {
//   const GetSpecialitiesModel({
//     required super.success,
//     required super.message,
//     required super.data,
//   });
//
//   factory GetSpecialitiesModel.fromJson(Map<String, dynamic> json) =>
//       GetSpecialitiesModel(
//         success: json['success'],
//         message: json['message'],
//         data: (json['data'] as List<dynamic>)
//             .map((dynamic e) => SpecialityModel.fromJson(e))
//             .toList(),
//       );
// }

class SpecialityModel extends Speciality {
  const SpecialityModel({
    required super.id,
    required super.surveyId,
    required super.title,
    required super.icon,
    required super.children,
  });

  factory SpecialityModel.fromJson(Map<String, dynamic> json) =>
      SpecialityModel(
        id: json['id'] != null
            ? num.tryParse(json['id'].toString())?.toInt() ?? 0
            : 0,
        surveyId: json['survey_id'] != null
            ? num.tryParse(json['survey_id'].toString())?.toInt() ?? 0
            : 0,
        title: json['title'] ?? '',
        icon: json['icon'] ?? '',
        children: json['children'] != null
            ? (json['children'] as List<dynamic>)
                .map((dynamic e) => SpecialityModel.fromJson(e))
                .toList()
            : const <Speciality>[],
      );
  Map<String, dynamic> toJson() => {
        'id': id,
        'survey_id': surveyId,
        'title': title,
        'children':
            children.isEmpty ? [] : List<dynamic>.from(children.map((x) => x)),
        'icon': icon,
      };
}

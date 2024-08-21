import '../../domain/entities/get_cities_response.dart';

class GetCitiesModel extends GetCitiesResponse {
  const GetCitiesModel({
    required super.success,
    required super.message,
    required super.data,
  });

  factory GetCitiesModel.fromJson(Map<String, dynamic> json) =>
      GetCitiesModel(
        success: json['success'],
        message: json['message'],
        data: (json['data'] as List<dynamic>)
            .map((dynamic e) => CityModel.fromJson(e))
            .toList(),
      );
}


class CityModel extends City {
  const CityModel({
    required super.id,
    required super.governmentId,
    required super.name,
    required super.lat,
    required super.lon,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
    id: json['id'] != null? num.tryParse(json['id'].toString())?.toInt()?? 0: 0,
    governmentId: json['government_id'] != null? num.tryParse(json['government_id'].toString())?.toInt(): null,
    name: json['name'] ?? '',
    lat: json['lat'],
    lon: json['lon'],
  );

}




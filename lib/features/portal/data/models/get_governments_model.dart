import '../../domain/entities/get_cities_response.dart';
import '../../domain/entities/get_governments_response.dart';
import 'get_cities_model.dart';

class GetGovernmentsModel extends GetGovernmentsResponse {
  const GetGovernmentsModel({
    required super.success,
    required super.message,
    required super.data,
  });

  factory GetGovernmentsModel.fromJson(Map<String, dynamic> json) =>
      GetGovernmentsModel(
        success: json['success'],
        message: json['message'],
        data: (json['data'] as List<dynamic>)
            .map((dynamic e) => GovernmentModel.fromJson(e))
            .toList(),
      );
}


class GovernmentModel extends Government {
  const GovernmentModel({
    required super.id,
    required super.name,
    required super.countryId,
    required super.lat,
    required super.lon,
    required super.cities,
  });

  factory GovernmentModel.fromJson(Map<String, dynamic> json) => GovernmentModel(
    id: json['id'] != null? num.tryParse(json['id'].toString())?.toInt()?? 0: 0,
    name: json['name'] ?? '',
    countryId: json['country_id'] != null? num.tryParse(json['country_id'].toString())?.toInt()?? 0: 0,
    lat: json['lat'] ?? '',
    lon: json['lon'] ?? '',
    cities: json['cities'] != null? (json['cities'] as List<dynamic>).map((dynamic e) => CityModel.fromJson(e)).toList() : const <City>[],
  );

}



import 'package:equatable/equatable.dart';

import 'get_cities_response.dart';

class GetGovernmentsResponse extends Equatable{
  final bool success;
  final String message;
  final List<Government> data;

  const GetGovernmentsResponse({
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


class Government extends Equatable {
  final int id;
  final String name;
  final int countryId;
  final String lat;
  final String lon;
  final List<City> cities;

  const Government({
    required this.id,
    required this.name,
    required this.countryId,
    required this.lat,
    required this.lon,
    required this.cities,
  });

  Government copyWith({
    int? id,
    String? name,
    int? countryId,
    String? lat,
    String? lon,
    List<City>? cities,
  }) {
    return Government(
      id: id ?? this.id,
      name: name ?? this.name,
      countryId: countryId ?? this.countryId,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      cities: cities ?? this.cities,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    id,
    name,
    countryId,
    lat,
    lon,
    cities,
  ];

}

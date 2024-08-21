import 'package:equatable/equatable.dart';

class GetCitiesResponse extends Equatable{
  final bool success;
  final String message;
  final List<City> data;

  const GetCitiesResponse({
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


class City extends Equatable {
  final int id;
  final int? governmentId;
  final String name;
  final String? lat;
  final String? lon;

  const City({
    required this.id,
    required this.governmentId,
    required this.name,
    required this.lat,
    required this.lon,
  });

  City copyWith({
    int? id,
    int? governmentId,
    String? name,
    String? lat,
    String? lon,
  }) {
    return City(
      id: id ?? this.id,
      governmentId: governmentId ?? this.governmentId,
      name: name ?? this.name,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    id,
    governmentId,
    name,
    lat,
    lon,
  ];

}



import 'package:equatable/equatable.dart';

class GetCountriesResponse extends Equatable{
  final bool success;
  final String message;
  final List<Country> data;

  const GetCountriesResponse({
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


class Country extends Equatable {
  final int id;
  final String name;
  final String code;
  final Currency? currency;
  final int currencyId;
  final String icon;
  final String lat;
  final String lon;

  const Country({
    required this.id,
    required this.name,
    required this.code,
    required this.currency,
    required this.currencyId,
    required this.icon,
    required this.lat,
    required this.lon,
  });

  Country copyWith({
    int? id,
    String? name,
    String? code,
    Currency? currency,
    int? currencyId,
    String? icon,
    String? lat,
    String? lon,
  }) {
    return Country(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      currency: currency ?? this.currency,
      currencyId: currencyId ?? this.currencyId,
      icon: icon ?? this.icon,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    id,
    name,
    code,
    currency,
    currencyId,
    icon,
    lat,
    lon,
  ];

}

class Currency extends Equatable {
  final int id;
  final String name;
  final String code;

  const Currency({
    required this.id,
    required this.name,
    required this.code,
  });

  Currency copyWith({
    int? id,
    String? name,
    String? code,
  }) {
    return Currency(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    id,
    name,
    code,
  ];

}



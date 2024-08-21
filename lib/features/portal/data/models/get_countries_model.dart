import '../../domain/entities/get_countries_response.dart';

class GetCountriesModel extends GetCountriesResponse {
  const GetCountriesModel({
    required super.success,
    required super.message,
    required super.data,
  });

  factory GetCountriesModel.fromJson(Map<String, dynamic> json) =>
      GetCountriesModel(
        success: json['success'],
        message: json['message'],
        data: (json['data'] as List<dynamic>)
            .map((dynamic e) => CountryModel.fromJson(e))
            .toList(),
      );
}

class CountryModel extends Country {
  const CountryModel({
    required super.id,
    required super.name,
    required super.code,
    required super.currency,
    required super.currencyId,
    required super.icon,
    required super.lat,
    required super.lon,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        id: json['id'] != null
            ? num.tryParse(json['id'].toString())?.toInt() ?? 0
            : 0,
        name: json['name'] ?? '',
        code: json['code'] ?? '',
        currency: json['currency'] != null
            ? CurrencyModel.fromJson(json['currency'])
            : null,
        currencyId: json['currency_id'] != null
            ? num.tryParse(json['currency_id'].toString())?.toInt() ?? 0
            : 0,
        icon: json['icon'] ?? '',
        lat: json['lat'] ?? '',
        lon: json['lon'] ?? '',
      );
}

class CurrencyModel extends Currency {
  const CurrencyModel({
    required super.id,
    required super.name,
    required super.code,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
        id: json['id'] != null
            ? num.tryParse(json['id'].toString())?.toInt() ?? 0
            : 0,
        name: json['name'] ?? '',
        code: json['code'] ?? '',
      );
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'code': code,
      };
}

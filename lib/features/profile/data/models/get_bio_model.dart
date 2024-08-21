import '../../domain/entities/get_bio_response.dart';

class GetBioModel extends GetBioResponse {
  const GetBioModel({
    required super.success,
    required super.message,
    required super.data,
  });

  factory GetBioModel.fromJson(Map<String, dynamic> json) =>
      GetBioModel(
        success: json['success'],
        message: json['message'],
        data: BioDataModel.fromJson(json['data']),
      );
}


class BioDataModel extends BioData {
  const BioDataModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.bio,
  });

  factory BioDataModel.fromJson(Map<String, dynamic> json) => BioDataModel(
    id: json['id'] != null? num.tryParse(json['id'].toString())?.toInt()?? 0: 0,
    firstName: json['first_name'] != null? FirstNameModel.fromJson(json['first_name']) : null,
    lastName: json['last_name'] != null? LastNameModel.fromJson(json['last_name']) : null,
    bio: json['bio'] != null? BioModel.fromJson(json['bio']) : null,
  );

}


class BioModel extends Bio {
  const BioModel({
    required super.ar,
    required super.en,
  });

  factory BioModel.fromJson(Map<String, dynamic> json) => BioModel(
    ar: json['ar'] ?? '',
    en: json['en'] ?? '',
  );

}


class LastNameModel extends LastName {
  const LastNameModel({
    required super.ar,
    required super.en,
  });

  factory LastNameModel.fromJson(Map<String, dynamic> json) => LastNameModel(
    ar: json['ar'] ?? '',
    en: json['en'] ?? '',
  );

}


class FirstNameModel extends FirstName {
  const FirstNameModel({
    required super.ar,
    required super.en,
  });

  factory FirstNameModel.fromJson(Map<String, dynamic> json) => FirstNameModel(
    ar: json['ar'] ?? '',
    en: json['en'] ?? '',
  );

}




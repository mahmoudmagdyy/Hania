import '../../../../core/utils/extension.dart';
import '../../../portal/data/models/get_countries_model.dart';
import '../../../portal/data/models/get_specialities_model.dart';
import '../../../portal/domain/entities/get_specialities_response.dart';
import '../../domain/entities/get_profile_response.dart';
import 'get_bio_model.dart';

class GetProfileModel extends GetProfileResponse {
  const GetProfileModel({
    required super.success,
    required super.message,
    required super.data,
  });

  factory GetProfileModel.fromJson(Map<String, dynamic> json) =>
      GetProfileModel(
        success: json['success'],
        message: json['message'],
        data: UserModel.fromJson(json['data']['user']),
      );
}

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.email,
    required super.firstname,
    required super.lastname,
    required super.mobile,
    required super.gender,
    required super.active,
    required super.photo,
    required super.userType,
    required super.city,
    required super.country,
    required super.isEmailVerified,
    required super.isMobileVerified,
    required super.points,
    required super.balance,
    required super.totalBalance,
    required super.doctor,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] != null
            ? num.tryParse(json['id'].toString())?.toInt() ?? 0
            : 0,
        email: json['email'] ?? '',
        firstname: json['firstname'] ?? '',
        lastname: json['lastname'] ?? '',
        mobile: json['mobile'] ?? '',
        gender: json['gender'] ?? '',
        active: json['active'] != null ? json['active'] as bool : false,
        photo: json['photo'] ?? '',
        userType: json['user_type'] ?? '',
        country: json['country'] != null
            ? CountryModel.fromJson(json['country'])
            : null,
        city:
            json['city'] != null ? UserCityModel.fromJson(json['city']) : null,
        isEmailVerified: json['is_email_verified'] != null
            ? json['is_email_verified'] as bool
            : false,
        isMobileVerified: json['is_mobile_verified'] != null
            ? json['is_mobile_verified'] as bool
            : false,
        points: json['points'] != null
            ? num.tryParse(json['points'].toString())?.toInt() ?? 0
            : 0,
        balance: json['balance'] != null
            ? num.tryParse(json['balance'].toString())?.toInt() ?? 0
            : 0,
        totalBalance: json['total_balance'] != null
            ? double.parse((json['total_balance'] ?? 0).toString())
            : 0.0,
        doctor: DoctorModel.fromJson(json['doctor']),
      );
}

class DoctorModel extends Doctor {
  const DoctorModel({
    required super.id,
    required super.photo,
    required super.practiceCert,
    required super.phone,
    required super.dob,
    required super.firstnameAr,
    required super.firstnameEn,
    required super.lastnameAr,
    required super.lastnameEn,
    required super.distance,
    required super.avgRating,
    required super.profileVisitCount,
    required super.bio,
    required super.isBio,
    required super.readBioFromApproval,
    required super.readTitleFromApproval,
    required super.specialities,
    required super.title,
    required super.isPromoted,
    required super.tags,
    required super.nationalNumber,
    required super.nationalIdImages,
    required super.status,
    required super.flow,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
        id: json['id'] != null
            ? num.tryParse(json['id'].toString())?.toInt() ?? 0
            : 0,
        photo: json['photo'] ?? '',
        practiceCert: json['practice_cert'] ?? '',
        phone: json['phone'] ?? '',
        dob: json['dob'] ?? '',
        firstnameAr: json['first_name']?['ar'] ?? '',
        firstnameEn: json['first_name']?['en'] ?? '',
        lastnameAr: json['last_name']?['ar'] ?? '',
        lastnameEn: json['last_name']?['en'] ?? '',
        distance: json['distance'] ?? '',
        avgRating: json['avg_rating'] != null
            ? num.tryParse(json['avg_rating'].toString())?.toInt() ?? 0
            : 0,
        profileVisitCount: json['profile_visit_count'] != null
            ? num.tryParse(json['profile_visit_count'].toString())?.toInt() ?? 0
            : 0,
        bio: json['bio'] != null ? BioModel.fromJson(json['bio']) : null,
        isBio: json['is_bio'] ?? false,
        readBioFromApproval: json['read_bio_from_approval'] ?? false,
        readTitleFromApproval: json['read_title_from_approval'] ?? false,
        specialities: json['specialities'] != null
            ? (json['specialities'] as List<dynamic>)
                .map((dynamic e) => SpecialityModel.fromJson(e))
                .toList()
            : const <Speciality>[],
        title: json['title'] ?? '',
        isPromoted:
            json['is_promoted'] != null ? json['is_promoted'] as bool : false,
        tags: json['tags'] != null
            ? (json['tags'] as List<dynamic>)
                .map((dynamic e) => e?.toString() ?? '')
                .toList()
            : const <String>[],
        nationalNumber: json['national_number']?.toString() ?? '',
        nationalIdImages: json['national_id'] != null
            ? (json['national_id'] as List<dynamic>)
                .map((dynamic e) => e?.toString() ?? '')
                .toList()
            : const <String>[],
        status: UserStatusExtension.fromString(json['status'] ?? ''),
        flow: json['flow'] != null ? FlowModel.fromJson(json['flow']) : null,
      );
}

class FlowModel extends Flow {
  const FlowModel({
    required super.id,
    required super.logs,
  });

  factory FlowModel.fromJson(Map<String, dynamic> json) => FlowModel(
        id: json['id'] != null
            ? num.tryParse(json['id'].toString())?.toInt() ?? 0
            : 0,
        logs: LogModel.fromJson(json['logs']),
      );
}

class LogModel extends Log {
  const LogModel({
    required super.id,
    required super.status,
    required super.comment,
  });

  factory LogModel.fromJson(Map<String, dynamic> json) => LogModel(
        id: json['id'] != null
            ? num.tryParse(json['id'].toString())?.toInt() ?? 0
            : 0,
        status: json['status'] ?? '',
        comment: json['comment'] != null
            ? (json['comment'] as List<dynamic>)
                .map((dynamic e) => e?.toString() ?? '')
                .toList()
            : <String>[],
      );
}

class SocialUserModel extends SocialUser {
  const SocialUserModel({
    required super.id,
  });

  factory SocialUserModel.fromJson(Map<String, dynamic> json) =>
      SocialUserModel(
        id: json['id'] != null
            ? num.tryParse(json['id'].toString())?.toInt() ?? 0
            : 0,
      );
}

class UserCityModel extends UserCity {
  const UserCityModel({
    required super.id,
    required super.name,
    required super.governmentId,
    required super.lat,
    required super.lon,
  });

  factory UserCityModel.fromJson(Map<String, dynamic> json) => UserCityModel(
        id: json['id'] != null
            ? num.tryParse(json['id'].toString())?.toInt() ?? 0
            : 0,
        name: json['name'],
        governmentId: json['government_id'] != null
            ? num.tryParse(json['government_id'].toString())?.toInt()
            : null,
        lat: json['lat'],
        lon: json['lon'],
      );
}

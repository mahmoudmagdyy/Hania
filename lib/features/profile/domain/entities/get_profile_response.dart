import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums.dart';
import '../../../portal/domain/entities/get_countries_response.dart';
import '../../../portal/domain/entities/get_specialities_response.dart';
import 'get_bio_response.dart';

class GetProfileResponse extends Equatable {
  final bool success;
  final String message;
  final User data;

  const GetProfileResponse({
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

class User extends Equatable {
  final int id;
  final String email;
  final String firstname;
  final String lastname;
  final String mobile;
  final String gender;
  final bool active;
  final String photo;
  final String userType;
  final UserCity? city;
  final Country? country;
  final bool isEmailVerified;
  final bool isMobileVerified;
  final int points;
  final int balance;
  final double totalBalance;
  final Doctor doctor;

  const User({
    required this.id,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.mobile,
    required this.gender,
    required this.active,
    required this.photo,
    required this.userType,
    required this.city,
    required this.country,
    required this.isEmailVerified,
    required this.isMobileVerified,
    required this.points,
    required this.balance,
    required this.totalBalance,
    required this.doctor,
  });

  User copyWith({
    int? id,
    String? email,
    String? firstname,
    String? lastname,
    String? mobile,
    String? gender,
    bool? active,
    String? photo,
    String? userType,
    UserCity? city,
    Country? country,
    bool? isEmailVerified,
    bool? isMobileVerified,
    int? points,
    int? balance,
    double? totalBalance,
    Doctor? doctor,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      mobile: mobile ?? this.mobile,
      gender: gender ?? this.gender,
      active: active ?? this.active,
      photo: photo ?? this.photo,
      userType: userType ?? this.userType,
      city: city ?? this.city,
      country: country ?? this.country,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      isMobileVerified: isMobileVerified ?? this.isMobileVerified,
      points: points ?? this.points,
      balance: balance ?? this.balance,
      totalBalance: totalBalance ?? this.totalBalance,
      doctor: doctor ?? this.doctor,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        id,
        email,
        firstname,
        lastname,
        mobile,
        gender,
        active,
        photo,
        userType,
        city,
        country,
        isEmailVerified,
        isMobileVerified,
        points,
        balance,
        totalBalance,
        doctor,
      ];
}

class Doctor extends Equatable {
  final int id;
  final String photo;
  final String practiceCert;
  final String phone;
  final String firstnameAr;
  final String firstnameEn;
  final String lastnameAr;
  final String lastnameEn;
  final String dob;
  final String distance;
  final int avgRating;
  final int profileVisitCount;
  final Bio? bio;
  final bool isBio;
  final bool readBioFromApproval;
  final bool readTitleFromApproval;
  final List<Speciality> specialities;
  final String title;
  final bool isPromoted;
  final List<String> tags;
  final String nationalNumber;
  final List<String> nationalIdImages;
  final UserStatus status;
  final Flow? flow;

  const Doctor({
    required this.id,
    required this.photo,
    required this.practiceCert,
    required this.phone,
    required this.dob,
    required this.firstnameAr,
    required this.firstnameEn,
    required this.lastnameAr,
    required this.lastnameEn,
    required this.distance,
    required this.avgRating,
    required this.profileVisitCount,
    required this.bio,
    required this.isBio,
    required this.readBioFromApproval,
    required this.readTitleFromApproval,
    required this.specialities,
    required this.title,
    required this.isPromoted,
    required this.tags,
    required this.status,
    required this.flow,
    required this.nationalNumber,
    required this.nationalIdImages,
  });

  Doctor copyWith({
    int? id,
    String? photo,
    String? phone,
    String? dob,
    String? practiceCert,
    String? firstnameAr,
    String? firstnameEn,
    String? lastnameAr,
    String? lastnameEn,
    String? distance,
    int? avgRating,
    int? profileVisitCount,
    Bio? bio,
    bool? isBio,
    bool? readBioFromApproval,
    bool? readTitleFromApproval,
    List<Speciality>? specialities,
    String? title,
    bool? isPromoted,
    List<String>? tags,
    String? nationalNumber,
    List<String>? nationalIdImages,
    UserStatus? status,
    Flow? flow,
  }) {
    return Doctor(
      id: id ?? this.id,
      photo: photo ?? this.photo,
      practiceCert: practiceCert ?? this.practiceCert,
      phone: phone ?? this.phone,
      dob: dob ?? this.dob,
      firstnameAr: firstnameAr ?? this.firstnameAr,
      firstnameEn: firstnameEn ?? this.firstnameEn,
      lastnameAr: lastnameAr ?? this.lastnameAr,
      lastnameEn: lastnameEn ?? this.lastnameEn,
      distance: distance ?? this.distance,
      avgRating: avgRating ?? this.avgRating,
      profileVisitCount: profileVisitCount ?? this.profileVisitCount,
      bio: bio ?? this.bio,
      readBioFromApproval: readBioFromApproval ?? this.readBioFromApproval,
      readTitleFromApproval:
          readTitleFromApproval ?? this.readTitleFromApproval,
      isBio: isBio ?? this.isBio,
      specialities: specialities ?? this.specialities,
      title: title ?? this.title,
      isPromoted: isPromoted ?? this.isPromoted,
      tags: tags ?? this.tags,
      nationalNumber: nationalNumber ?? this.nationalNumber,
      nationalIdImages: nationalIdImages ?? this.nationalIdImages,
      status: status ?? this.status,
      flow: flow ?? this.flow,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        id,
        photo,
        practiceCert,
        phone,
        dob,
        firstnameAr,
        firstnameEn,
        lastnameAr,
        lastnameEn,
        distance,
        avgRating,
        profileVisitCount,
        bio,
        isBio,
        readBioFromApproval,
        readTitleFromApproval,
        specialities,
        title,
        isPromoted,
        tags,
        nationalNumber,
        nationalIdImages,
        status,
        flow,
      ];
}

class Flow extends Equatable {
  final int id;
  final Log logs;

  const Flow({
    required this.id,
    required this.logs,
  });

  Flow copyWith({
    int? id,
    Log? logs,
  }) {
    return Flow(
      id: id ?? this.id,
      logs: logs ?? this.logs,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        id,
        logs,
      ];
}

class Log extends Equatable {
  final int id;
  final String status;
  final List<String> comment;

  const Log({
    required this.id,
    required this.status,
    required this.comment,
  });

  Log copyWith({
    int? id,
    String? status,
    List<String>? comment,
  }) {
    return Log(
      id: id ?? this.id,
      status: status ?? this.status,
      comment: comment ?? this.comment,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        id,
        status,
        comment,
      ];
}

class SocialUser extends Equatable {
  final int id;

  const SocialUser({
    required this.id,
  });

  SocialUser copyWith({
    int? id,
  }) {
    return SocialUser(
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        id,
      ];
}

class UserCity extends Equatable {
  final int id;
  final String name;
  final int? governmentId;
  final String? lat;
  final String? lon;

  const UserCity({
    required this.id,
    required this.name,
    required this.governmentId,
    required this.lat,
    required this.lon,
  });

  UserCity copyWith({
    int? id,
    String? name,
    int? governmentId,
    String? lat,
    String? lon,
  }) {
    return UserCity(
      id: id ?? this.id,
      name: name ?? this.name,
      governmentId: governmentId ?? this.governmentId,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
        governmentId,
        lat,
        lon,
      ];
}

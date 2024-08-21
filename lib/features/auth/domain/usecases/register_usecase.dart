import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/extension.dart';
import '../entities/register_response.dart';
import '../repositories/auth_repo.dart';


class RegisterUseCase extends UseCase<RegisterResponse, RegisterParams> {
  final AuthRepository repository;

  RegisterUseCase({required this.repository});

  @override
  Future<Either<Failure, RegisterResponse>> call(RegisterParams params) async {
    return await repository.register(params: params);
  }
}


class RegisterParams extends Equatable {
  final String firstName;
  // final String middleAndLastName;
  final String email;
  final String mobile;
  final String callingCode;
  final String dob;
  final String gender;
  final String password;
  final String passwordConfirmation;
  final bool conditionsAgreement;
  final int? countryId;
  final int? cityId;
  final int specialityId;
  final int? subSpecialityId;
  final int? titleId;
  final File? doctorPhoto;
  final File certificatePhoto;
  final String nationalNumber;
  final List<File> nationalNumberImages;

  const RegisterParams({
    required this.firstName,
    // required this.middleAndLastName,
    required this.email,
    required this.mobile,
    required this.callingCode,
    required this.dob,
    required this.gender,
    required this.password,
    required this.passwordConfirmation,
    required this.conditionsAgreement,
    this.countryId,
    this.cityId,
    required this.specialityId,
    this.subSpecialityId,
    this.titleId,
    this.doctorPhoto,
    required this.certificatePhoto,
    required this.nationalNumber,
    required this.nationalNumberImages,
  });

  Future<FormData> toJson() async{
    final FormData formData = FormData.fromMap({
      'first_name': firstName,
      // 'last_name': middleAndLastName,
      'email': email,
      'mobile': mobile,
      'calling_code': callingCode,
      'dob': dob,
      'gender': gender,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'conditions_agreement': conditionsAgreement,
      'country_id': countryId,
      'city_id': cityId,
      'doctor[speciality_id]': specialityId,
      'doctor[sub_speciality_id]': subSpecialityId,
      'doctor[title_id]': titleId,
      'national_number': nationalNumber,
    });
    formData.files.add(MapEntry('doctor[attachments][practice_cert][0]', await MultipartFile.fromFile(
        certificatePhoto.path,
        filename: certificatePhoto.path.split('/').last,
    )));
    if(doctorPhoto != null){
      formData.files.add(MapEntry('photo', await MultipartFile.fromFile(
          doctorPhoto!.path,
          filename: doctorPhoto!.path.split('/').last,
      )));
    }

    int i = 0;
    for(final item in nationalNumberImages){
      formData.files.add(MapEntry('doctor[attachments][national_id][$i]', await MultipartFile.fromFile(
        item.path,
        filename: item.path.split('/').last,
      )));
      i++;
    }

    log('RegisterParams: ${formData.toPrint}');

    return formData;

  }

  @override
  List<Object?> get props => <Object?>[
    firstName,
    // middleAndLastName,
    email,
    mobile,
    callingCode,
    dob,
    gender,
    password,
    passwordConfirmation,
    conditionsAgreement,
    countryId,
    cityId,
    specialityId,
    subSpecialityId,
    titleId,
    nationalNumber,
    nationalNumberImages,
  ];

}




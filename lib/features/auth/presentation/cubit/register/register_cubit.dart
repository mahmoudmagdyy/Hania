import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/utils/values/strings.dart';
import '../../../../../injection_container.dart';
import '../../../domain/usecases/register_usecase.dart';
import '../../../domain/entities/register_response.dart';

part 'register_states.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterCubit(this.registerUseCase) : super(const RegisterInitialState());

  RegisterData? data;
  File? doctorPhoto;
  File? certificatePhoto;
  List<File> nationalNumberImages = [];

  Future<void> fRegister({
   required String firstName,
   // required String middleAndLastName,
   required String email,
   required String mobile,
   required String callingCode,
   required String dob,
   required String gender,
   required String password,
   required String passwordConfirmation,
   required bool conditionsAgreement,
   required int specialityId,
   int? subSpecialityId,
   int? titleId,
   int? cityId,
   required String nationalNumber,
  }) async {
    emit(const RegisterLoadingState());
    final Either<Failure, RegisterResponse> eitherResult = await registerUseCase(RegisterParams(
      firstName: firstName,
      // middleAndLastName: middleAndLastName,
      email: email,
      mobile: mobile,
      callingCode: callingCode,
      dob: dob,
      gender: gender,
      password: password,
      passwordConfirmation: passwordConfirmation,
      conditionsAgreement: conditionsAgreement,
      countryId: sharedPreferences.getCountryId()?? 1,
      cityId: cityId,
      specialityId: specialityId,
      subSpecialityId: subSpecialityId,
      titleId: titleId,
      certificatePhoto: certificatePhoto!,
      doctorPhoto: doctorPhoto,
      nationalNumber: nationalNumber,
      nationalNumberImages: nationalNumberImages,
    ));
    eitherResult.fold((Failure failure) {
      emit(RegisterErrorState(message: failure.message?? Strings.pleaseTryAgainLater));
    }, (RegisterResponse response) {
      data = response.data;
      emit(RegisterSuccessState(value: response.data));
    });
  }

  void setDoctorPhoto(File photo){
    doctorPhoto = photo;
    emit(const RegisterLoadingState());
    emit(const RegisterInitialState());
  }

  void setNationalNumberImages(List<File> values){
    nationalNumberImages = values;
    emit(const RegisterLoadingState());
    emit(const RegisterInitialState());
  }

  void setCertificatePhoto(File photo){
    certificatePhoto = photo;
    emit(const RegisterLoadingState());
    emit(const RegisterInitialState());
  }

  void resetFields(){
    data = null;
    doctorPhoto = null;
    certificatePhoto = null;
    nationalNumberImages = [];
    emit(const RegisterInitialState());
  }
}


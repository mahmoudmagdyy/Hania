import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/utils/values/strings.dart';
import '../../../domain/usecases/update_doctor_title_usecase.dart';
import '../../../domain/entities/update_doctor_title_response.dart';

part 'update_doctor_title_states.dart';

class UpdateDoctorTitleCubit extends Cubit<UpdateDoctorTitleState> {
  final UpdateDoctorTitleUseCase updateDoctorTitleUseCase;

  UpdateDoctorTitleCubit(this.updateDoctorTitleUseCase) : super(const UpdateDoctorTitleInitialState());

  File? certificatePhoto;
  bool isDataChangedFromUser = false;
  Map<String, dynamic>? titleCert;

  Future<void> fUpdateDoctorTitle({
   required int titleId,
  }) async {
    emit(const UpdateDoctorTitleLoadingState());
    final Either<Failure, UpdateDoctorTitleResponse> eitherResult = await updateDoctorTitleUseCase(UpdateDoctorTitleParams(
      titleId: titleId,
      titleCert: titleCert,
    ));
    eitherResult.fold((Failure failure) {
      emit(UpdateDoctorTitleErrorState(message: failure.message?? Strings.pleaseTryAgainLater));
    }, (UpdateDoctorTitleResponse response) {
      emit(UpdateDoctorTitleSuccessState(message: response.message));
    });
  }

  void setCertificatePhoto(File photo){
    certificatePhoto = photo;
    emitDataChangedFromUser(true);
  }

  void setTitleCertPath({
    required String path,
    required String url,
  }){
    titleCert = {
      'path': path,
      'url': url,
    };
    emit(const UpdateDoctorTitleLoadingState());
    emit(const UpdateDoctorTitleInitialState());
  }

  void emitDataChangedFromUser(bool value){
    isDataChangedFromUser = value;
    emit(const UpdateDoctorTitleLoadingState());
    emit(const UpdateDoctorTitleInitialState());
  }

  void resetFields(){
    certificatePhoto = null;
    isDataChangedFromUser = false;
    titleCert = null;
    emit(const UpdateDoctorTitleInitialState());
  }
}


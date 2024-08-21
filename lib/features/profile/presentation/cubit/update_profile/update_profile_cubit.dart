import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/utils/values/strings.dart';
import '../../../../portal/domain/entities/add_media_response.dart';
import '../../../domain/usecases/update_profile_usecase.dart';
import '../../../domain/entities/update_profile_response.dart';

part 'update_profile_states.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final UpdateProfileUseCase updateProfileUseCase;

  UpdateProfileCubit(this.updateProfileUseCase) : super(const UpdateProfileInitialState());

  File? doctorPhoto;
  bool isDataChangedFromUser = false;

  Future<void> fUpdateProfile({
   required String dob,
   required String gender,
   AddMediaResponseData? photo,
  }) async {
    emit(const UpdateProfileLoadingState());
    final Either<Failure, UpdateProfileResponse> eitherResult = await updateProfileUseCase(UpdateProfileParams(
      dob: dob,
      gender: gender,
      photo: photo,
    ));
    eitherResult.fold((Failure failure) {
      emit(UpdateProfileErrorState(message: failure.message?? Strings.pleaseTryAgainLater));
    }, (UpdateProfileResponse response) {
      emit(UpdateProfileSuccessState(message: response.message));
    });
  }

  void setDoctorPhoto(File photo){
    doctorPhoto = photo;
    isDataChangedFromUser = true;
    emit(const UpdateProfileLoadingState());
    emit(const UpdateProfileInitialState());
  }

  void emitDataChangedFromUser(bool value){
    isDataChangedFromUser = value;
    emit(const UpdateProfileLoadingState());
    emit(const UpdateProfileInitialState());
  }

  void resetFields(){
    isDataChangedFromUser = false;
    doctorPhoto = null;
  }
}


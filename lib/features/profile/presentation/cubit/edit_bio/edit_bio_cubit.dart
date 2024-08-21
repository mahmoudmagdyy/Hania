import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/utils/values/strings.dart';
import '../../../domain/usecases/edit_bio_usecase.dart';
import '../../../domain/entities/edit_bio_response.dart';

part 'edit_bio_states.dart';

class EditBioCubit extends Cubit<EditBioState> {
  final EditBioUseCase editBioUseCase;

  EditBioCubit(this.editBioUseCase) : super(const EditBioInitialState());

  bool isDataChangedFromUser = false;

  Future<void> fEditBio({
   required Map<String, dynamic> bio,
   required Map<String, dynamic> firstname,
   required Map<String, dynamic> lastname,
  }) async {
    emit(const EditBioLoadingState());
    final Either<Failure, EditBioResponse> eitherResult = await editBioUseCase(EditBioParams(
      bio: bio,
      firstname: firstname,
      lastname: lastname,
    ));
    eitherResult.fold((Failure failure) {
      emit(EditBioErrorState(message: failure.message?? Strings.pleaseTryAgainLater));
    }, (EditBioResponse response) {
      emit(EditBioSuccessState(message: response.message));
    });
  }

  void emitDataChangedFromUser(bool value){
    isDataChangedFromUser = value;
    emit(const EditBioLoadingState());
    emit(const EditBioInitialState());
  }

  void resetFields(){
    isDataChangedFromUser = false;
  }
}


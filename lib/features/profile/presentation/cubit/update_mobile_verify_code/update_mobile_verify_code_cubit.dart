import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/utils/values/strings.dart';
import '../../../domain/usecases/update_mobile_verify_code_usecase.dart';
import '../../../domain/entities/update_mobile_verify_code_response.dart';

part 'update_mobile_verify_code_states.dart';

class UpdateMobileVerifyCodeCubit extends Cubit<UpdateMobileVerifyCodeState> {
  final UpdateMobileVerifyCodeUseCase updateMobileVerifyCodeUseCase;

  UpdateMobileVerifyCodeCubit(this.updateMobileVerifyCodeUseCase) : super(const UpdateMobileVerifyCodeInitialState());


  Future<void> fUpdateMobileVerifyCode({
   required String mobile,
   required String code,
  }) async {
    emit(const UpdateMobileVerifyCodeLoadingState());
    final Either<Failure, UpdateMobileVerifyCodeResponse> eitherResult = await updateMobileVerifyCodeUseCase(UpdateMobileVerifyCodeParams(
      mobile: mobile,
      code: code,
    ));
    eitherResult.fold((Failure failure) {
      emit(UpdateMobileVerifyCodeErrorState(message: failure.message?? Strings.pleaseTryAgainLater));
    }, (UpdateMobileVerifyCodeResponse response) {
      emit(UpdateMobileVerifyCodeSuccessState(
        message: response.message,
      ));
    });
  }

  void emitInitState(){
    emit(const UpdateMobileVerifyCodeInitialState());
  }
}


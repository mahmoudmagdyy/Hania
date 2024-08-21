import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/utils/values/strings.dart';
import '../../../domain/entities/get_profile_response.dart';
import '../../../domain/usecases/update_email_verify_code_usecase.dart';
import '../../../domain/entities/update_email_verify_code_response.dart';

part 'update_email_verify_code_states.dart';

class UpdateEmailVerifyCodeCubit extends Cubit<UpdateEmailVerifyCodeState> {
  final UpdateEmailVerifyCodeUseCase updateEmailVerifyCodeUseCase;

  UpdateEmailVerifyCodeCubit(this.updateEmailVerifyCodeUseCase) : super(const UpdateEmailVerifyCodeInitialState());

  Future<void> fUpdateEmailVerifyCode({
   required String email,
   required String code,
  }) async {
    emit(const UpdateEmailVerifyCodeLoadingState());
    final Either<Failure, UpdateEmailVerifyCodeResponse> eitherResult = await updateEmailVerifyCodeUseCase(UpdateEmailVerifyCodeParams(
      email: email,
      code: code,
    ));
    eitherResult.fold((Failure failure) {
      emit(UpdateEmailVerifyCodeErrorState(message: failure.message?? Strings.pleaseTryAgainLater));
    }, (UpdateEmailVerifyCodeResponse response) {
      emit(UpdateEmailVerifyCodeSuccessState(message: response.message));
    });
  }

  void emitInitState(){
    emit(const UpdateEmailVerifyCodeInitialState());
  }
}


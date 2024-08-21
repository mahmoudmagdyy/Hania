import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/utils/values/strings.dart';
import '../../../domain/usecases/update_email_send_code_usecase.dart';
import '../../../domain/entities/update_email_send_code_response.dart';

part 'update_email_send_code_states.dart';

class UpdateEmailSendCodeCubit extends Cubit<UpdateEmailSendCodeState> {
  final UpdateEmailSendCodeUseCase updateEmailSendCodeUseCase;

  UpdateEmailSendCodeCubit(this.updateEmailSendCodeUseCase) : super(const UpdateEmailSendCodeInitialState());

  String email = '';
  Future<void> fUpdateEmailSendCode({
   required String email,
  }) async {
    emit(const UpdateEmailSendCodeLoadingState());
    final Either<Failure, UpdateEmailSendCodeResponse> eitherResult = await updateEmailSendCodeUseCase(UpdateEmailSendCodeParams(
      email: email,
    ));
    eitherResult.fold((Failure failure) {
      emit(UpdateEmailSendCodeErrorState(message: failure.message?? Strings.pleaseTryAgainLater));
    }, (UpdateEmailSendCodeResponse response) {
      this.email = email;
      emit(const UpdateEmailSendCodeSuccessState());
    });
  }

  void emitInitState(){
    emit(const UpdateEmailSendCodeInitialState());
  }
}


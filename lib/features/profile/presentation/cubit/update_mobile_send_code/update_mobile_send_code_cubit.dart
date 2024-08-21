import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/utils/values/strings.dart';
import '../../../domain/usecases/update_mobile_send_code_usecase.dart';
import '../../../domain/entities/update_mobile_send_code_response.dart';

part 'update_mobile_send_code_states.dart';

class UpdateMobileSendCodeCubit extends Cubit<UpdateMobileSendCodeState> {
  final UpdateMobileSendCodeUseCase updateMobileSendCodeUseCase;

  UpdateMobileSendCodeCubit(this.updateMobileSendCodeUseCase) : super(const UpdateMobileSendCodeInitialState());

  String mobile = '';
  String mobileWithCode = '';
  String callingCode = '';

  Future<void> fUpdateMobileSendCode({
   required String mobile,
   required String callingCode,
  }) async {
    emit(const UpdateMobileSendCodeLoadingState());
    final Either<Failure, UpdateMobileSendCodeResponse> eitherResult = await updateMobileSendCodeUseCase(UpdateMobileSendCodeParams(
      mobile: mobile,
      callingCode: callingCode,
    ));
    eitherResult.fold((Failure failure) {
      emit(UpdateMobileSendCodeErrorState(message: failure.message?? Strings.pleaseTryAgainLater));
    }, (UpdateMobileSendCodeResponse response) {
      this.mobile = mobile;
      mobileWithCode = response.newMobile;
      this.callingCode = callingCode;
      emit(UpdateMobileSendCodeSuccessState(message: response.message));
    });
  }

  void emitInitState(){
    emit(const UpdateMobileSendCodeInitialState());
  }
}


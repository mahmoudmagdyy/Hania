import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/utils/values/strings.dart';
import '../../../domain/usecases/login_email_usecase.dart';
import '../../../domain/entities/login_email_response.dart';

part 'login_email_states.dart';

class LoginEmailCubit extends Cubit<LoginEmailState> {
  final LoginEmailUseCase loginEmailUseCase;

  LoginEmailCubit(this.loginEmailUseCase) : super(const LoginEmailInitialState());

  LoginEmailData? data;

  Future<void> fLoginEmail({
   required String email,
   required String password,
  }) async {
    emit(const LoginEmailLoadingState());
    final Either<Failure, LoginEmailResponse> eitherResult = await loginEmailUseCase(LoginEmailParams(
      email: email,
      password: password,
    ));
    eitherResult.fold((Failure failure) {
      emit(LoginEmailErrorState(message: failure.message?? Strings.pleaseTryAgainLater));
    }, (LoginEmailResponse response) {
      data = response.data;
      emit(LoginEmailSuccessState(value: response.data));
    });
  }
}


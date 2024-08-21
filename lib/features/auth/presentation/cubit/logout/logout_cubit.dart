import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/utils/values/strings.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../../../injection_container.dart';
import '../../../domain/usecases/logout_usecase.dart';
import '../../../domain/entities/logout_response.dart';
import '../auto_login/auto_login_cubit.dart';

part 'logout_states.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final LogoutUseCase logoutUseCase;

  LogoutCubit(this.logoutUseCase) : super(const LogoutInitialState());


  Future<void> fLogout() async {
    emit(const LogoutLoadingState());
    final Either<Failure, LogoutResponse> eitherResult = await logoutUseCase(NoParams());
    eitherResult.fold((Failure failure) {
      emit(LogoutErrorState(message: failure.message?? Strings.pleaseTryAgainLater));
    }, (LogoutResponse response) {
      ServiceLocator.instance<AutoLoginCubit>().fLogout();
      emit(const LogoutSuccessState());
    });
  }
}


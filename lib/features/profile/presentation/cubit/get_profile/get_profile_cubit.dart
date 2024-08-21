import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../../../core/utils/values/strings.dart';
import '../../../../../core/widgets/app_snack_bar.dart';
import '../../../../auth/presentation/cubit/auto_login/auto_login_cubit.dart';
import '../../../domain/usecases/get_profile_usecase.dart';
import '../../../domain/entities/get_profile_response.dart';

part 'get_profile_states.dart';

class GetProfileCubit extends Cubit<GetProfileState> {
  final GetProfileUseCase getProfileUseCase;

  GetProfileCubit(this.getProfileUseCase)
      : super(const GetProfileInitialState());

  User? user;

  Future<void> fGetProfile() async {
    emit(const GetProfileLoadingState());
    final Either<Failure, GetProfileResponse> eitherResult =
        await getProfileUseCase(NoParams());
    eitherResult.fold((Failure failure) {
      emit(GetProfileErrorState(
        message: failure.message ?? Strings.pleaseTryAgainLater,
        isExpired: failure is UnauthorizedFailure,
      ));
    }, (GetProfileResponse response) {
      user = response.data;
      emit(GetProfileSuccessState(value: user));
    });
  }
  
  void updateUser(User? data){
    emit(const GetProfileInitialState());
    user = data;
    emit(GetProfileUpdateUserState(user: user));
  }

  void emitErrorStateListener({
    required BuildContext context,
    required GetProfileErrorState state,
  }){
    showAppSnackBar(
      context: context,
      message: state.message,
      type: ToastType.error,
    );
    if (state.isExpired) {
      context.read<AutoLoginCubit>().fLogout();
      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.loginScreenRoute,
            (route) => false,
      );
    }
  }
}

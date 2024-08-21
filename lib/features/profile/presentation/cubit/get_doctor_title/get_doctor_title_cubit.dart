import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/utils/values/strings.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../domain/usecases/get_doctor_title_usecase.dart';
import '../../../domain/entities/get_doctor_title_response.dart';

part 'get_doctor_title_states.dart';

class GetDoctorTitleCubit extends Cubit<GetDoctorTitleState> {
  final GetDoctorTitleUseCase getDoctorTitleUseCase;

  GetDoctorTitleCubit(this.getDoctorTitleUseCase) : super(const GetDoctorTitleInitialState());

  GetDoctorTitleResponseData? data;

  Future<void> fGetDoctorTitle() async {
    emit(const GetDoctorTitleLoadingState());
    final Either<Failure, GetDoctorTitleResponse> eitherResult = await getDoctorTitleUseCase(NoParams());
    eitherResult.fold((Failure failure) {
      emit(GetDoctorTitleErrorState(message: failure.message?? Strings.pleaseTryAgainLater));
    }, (GetDoctorTitleResponse response) {
      data = response.data;
      emit(GetDoctorTitleSuccessState(value: response.data));
    });
  }
}


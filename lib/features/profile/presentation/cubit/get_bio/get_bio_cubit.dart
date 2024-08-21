import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/utils/values/strings.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../domain/usecases/get_bio_usecase.dart';
import '../../../domain/entities/get_bio_response.dart';

part 'get_bio_states.dart';

class GetBioCubit extends Cubit<GetBioState> {
  final GetBioUseCase getBioUseCase;

  GetBioCubit(this.getBioUseCase) : super(const GetBioInitialState());

  BioData? data;

  Future<void> fGetBio() async {
    emit(const GetBioLoadingState());
    final Either<Failure, GetBioResponse> eitherResult = await getBioUseCase(NoParams());
    eitherResult.fold((Failure failure) {
      emit(GetBioErrorState(message: failure.message?? Strings.pleaseTryAgainLater));
    }, (GetBioResponse response) {
      data = response.data;
      emit(GetBioSuccessState(value: response.data));
    });
  }
}


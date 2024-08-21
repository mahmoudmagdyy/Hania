import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/utils/values/strings.dart';
import '../../../domain/usecases/add_media_usecase.dart';
import '../../../domain/entities/add_media_response.dart';

part 'add_media_states.dart';

class AddMediaCubit extends Cubit<AddMediaState> {
  final AddMediaUseCase addMediaUseCase;

  AddMediaCubit(this.addMediaUseCase) : super(const AddMediaInitialState(id: ''));

  Future<void> fAddMedia({
    required String id,
    required List<File> media,
  }) async {
    emit(AddMediaLoadingState(id: id));
    final Either<Failure, AddMediaResponse> eitherResult =
        await addMediaUseCase(AddMediaParams(
      media: media,
    ));
    eitherResult.fold((Failure failure) {
      emit(AddMediaErrorState(
        message: failure.message ?? Strings.pleaseTryAgainLater,
        id: id,
      ));
    }, (AddMediaResponse response) {
      emit(AddMediaSuccessState(values: response.data, id: id));
    });
  }
}

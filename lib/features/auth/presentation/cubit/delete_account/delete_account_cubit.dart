import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/utils/values/strings.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../domain/usecases/delete_account_usecase.dart';
import '../../../domain/entities/delete_account_response.dart';

part 'delete_account_states.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  final DeleteAccountUseCase deleteAccountUseCase;

  DeleteAccountCubit(this.deleteAccountUseCase) : super(const DeleteAccountInitialState());


  Future<void> fDeleteAccount() async {
    emit(const DeleteAccountLoadingState());
    final Either<Failure, DeleteAccountResponse> eitherResult = await deleteAccountUseCase(NoParams());
    eitherResult.fold((Failure failure) {
      emit(DeleteAccountErrorState(message: failure.message?? Strings.pleaseTryAgainLater));
    }, (DeleteAccountResponse response) {
      emit(const DeleteAccountSuccessState());
    });
  }
}


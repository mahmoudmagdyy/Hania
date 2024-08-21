part of 'delete_account_cubit.dart';


abstract class DeleteAccountState extends Equatable {

  const DeleteAccountState();

  @override
  List<Object?> get props => <Object?>[];
}

class DeleteAccountInitialState extends DeleteAccountState {
  const DeleteAccountInitialState();
}

class DeleteAccountLoadingState extends DeleteAccountState {
  const DeleteAccountLoadingState();
}

class DeleteAccountSuccessState extends DeleteAccountState {
  const DeleteAccountSuccessState();

}

class DeleteAccountErrorState extends DeleteAccountState {
  final String message;

  const DeleteAccountErrorState({required this.message,});

  @override
  List<Object?> get props => <Object?>[message];
}


part of 'update_mobile_send_code_cubit.dart';


abstract class UpdateMobileSendCodeState extends Equatable {

  const UpdateMobileSendCodeState();

  @override
  List<Object?> get props => <Object?>[];
}

class UpdateMobileSendCodeInitialState extends UpdateMobileSendCodeState {
  const UpdateMobileSendCodeInitialState();
}

class UpdateMobileSendCodeLoadingState extends UpdateMobileSendCodeState {
  const UpdateMobileSendCodeLoadingState();
}

class UpdateMobileSendCodeSuccessState extends UpdateMobileSendCodeState {
  final String message;

  const UpdateMobileSendCodeSuccessState({required this.message,});

  @override
  List<Object?> get props => <Object?>[message];

}

class UpdateMobileSendCodeErrorState extends UpdateMobileSendCodeState {
  final String message;

  const UpdateMobileSendCodeErrorState({required this.message,});

  @override
  List<Object?> get props => <Object?>[message];
}


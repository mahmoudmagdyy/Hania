part of 'update_email_send_code_cubit.dart';


abstract class UpdateEmailSendCodeState extends Equatable {

  const UpdateEmailSendCodeState();

  @override
  List<Object?> get props => <Object?>[];
}

class UpdateEmailSendCodeInitialState extends UpdateEmailSendCodeState {
  const UpdateEmailSendCodeInitialState();
}

class UpdateEmailSendCodeLoadingState extends UpdateEmailSendCodeState {
  const UpdateEmailSendCodeLoadingState();
}

class UpdateEmailSendCodeSuccessState extends UpdateEmailSendCodeState {
  const UpdateEmailSendCodeSuccessState();

}

class UpdateEmailSendCodeErrorState extends UpdateEmailSendCodeState {
  final String message;

  const UpdateEmailSendCodeErrorState({required this.message,});

  @override
  List<Object?> get props => <Object?>[message];
}


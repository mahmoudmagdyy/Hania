part of 'update_email_verify_code_cubit.dart';


abstract class UpdateEmailVerifyCodeState extends Equatable {

  const UpdateEmailVerifyCodeState();

  @override
  List<Object?> get props => <Object?>[];
}

class UpdateEmailVerifyCodeInitialState extends UpdateEmailVerifyCodeState {
  const UpdateEmailVerifyCodeInitialState();
}

class UpdateEmailVerifyCodeLoadingState extends UpdateEmailVerifyCodeState {
  const UpdateEmailVerifyCodeLoadingState();
}

class UpdateEmailVerifyCodeSuccessState extends UpdateEmailVerifyCodeState {
  final User? value;
  final String message;

  const UpdateEmailVerifyCodeSuccessState({
    required this.message,
    this.value,
  });

  @override
  List<Object?> get props => <Object?>[value, message];
}

class UpdateEmailVerifyCodeErrorState extends UpdateEmailVerifyCodeState {
  final String message;

  const UpdateEmailVerifyCodeErrorState({required this.message,});

  @override
  List<Object?> get props => <Object?>[message];
}


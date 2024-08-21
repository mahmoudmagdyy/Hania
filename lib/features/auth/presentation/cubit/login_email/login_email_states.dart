part of 'login_email_cubit.dart';


abstract class LoginEmailState extends Equatable {

  const LoginEmailState();

  @override
  List<Object?> get props => <Object?>[];
}

class LoginEmailInitialState extends LoginEmailState {
  const LoginEmailInitialState();
}

class LoginEmailLoadingState extends LoginEmailState {
  const LoginEmailLoadingState();
}

class LoginEmailSuccessState extends LoginEmailState {
  final LoginEmailData? value;

  const LoginEmailSuccessState({required this.value});

  @override
  List<Object?> get props => <Object?>[value];
}

class LoginEmailErrorState extends LoginEmailState {
  final String message;

  const LoginEmailErrorState({required this.message,});

  @override
  List<Object?> get props => <Object?>[message];
}


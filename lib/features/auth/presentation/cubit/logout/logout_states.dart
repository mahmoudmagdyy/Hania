part of 'logout_cubit.dart';


abstract class LogoutState extends Equatable {

  const LogoutState();

  @override
  List<Object?> get props => <Object?>[];
}

class LogoutInitialState extends LogoutState {
  const LogoutInitialState();
}

class LogoutLoadingState extends LogoutState {
  const LogoutLoadingState();
}

class LogoutSuccessState extends LogoutState {
  const LogoutSuccessState();

}

class LogoutErrorState extends LogoutState {
  final String message;

  const LogoutErrorState({required this.message,});

  @override
  List<Object?> get props => <Object?>[message];
}


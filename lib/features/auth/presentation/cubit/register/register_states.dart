part of 'register_cubit.dart';


abstract class RegisterState extends Equatable {

  const RegisterState();

  @override
  List<Object?> get props => <Object?>[];
}

class RegisterInitialState extends RegisterState {
  const RegisterInitialState();
}

class RegisterLoadingState extends RegisterState {
  const RegisterLoadingState();
}

class RegisterSuccessState extends RegisterState {
  final RegisterData? value;

  const RegisterSuccessState({required this.value});

  @override
  List<Object?> get props => <Object?>[value];
}

class RegisterErrorState extends RegisterState {
  final String message;

  const RegisterErrorState({required this.message,});

  @override
  List<Object?> get props => <Object?>[message];
}


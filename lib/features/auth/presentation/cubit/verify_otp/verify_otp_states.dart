part of 'verify_otp_cubit.dart';


abstract class VerifyOtpState extends Equatable {

  const VerifyOtpState();

  @override
  List<Object?> get props => <Object?>[];
}

class VerifyOtpInitialState extends VerifyOtpState {
  const VerifyOtpInitialState();
}

class VerifyOtpLoadingState extends VerifyOtpState {
  const VerifyOtpLoadingState();
}

class VerifyOtpSuccessState extends VerifyOtpState {
  final VerifyOtpResponse? value;
  final bool isRegister;

  const VerifyOtpSuccessState({required this.value, required this.isRegister});

  @override
  List<Object?> get props => <Object?>[value, isRegister];
}

class VerifyOtpErrorState extends VerifyOtpState {
  final String message;

  const VerifyOtpErrorState({required this.message,});

  @override
  List<Object?> get props => <Object?>[message];
}


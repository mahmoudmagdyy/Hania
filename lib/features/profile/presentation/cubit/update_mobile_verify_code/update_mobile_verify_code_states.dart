part of 'update_mobile_verify_code_cubit.dart';


abstract class UpdateMobileVerifyCodeState extends Equatable {

  const UpdateMobileVerifyCodeState();

  @override
  List<Object?> get props => <Object?>[];
}

class UpdateMobileVerifyCodeInitialState extends UpdateMobileVerifyCodeState {
  const UpdateMobileVerifyCodeInitialState();
}

class UpdateMobileVerifyCodeLoadingState extends UpdateMobileVerifyCodeState {
  const UpdateMobileVerifyCodeLoadingState();
}

class UpdateMobileVerifyCodeSuccessState extends UpdateMobileVerifyCodeState {
  final String message;

  const UpdateMobileVerifyCodeSuccessState({
    required this.message,
  });

  @override
  List<Object?> get props => <Object?>[message];
}

class UpdateMobileVerifyCodeErrorState extends UpdateMobileVerifyCodeState {
  final String message;

  const UpdateMobileVerifyCodeErrorState({required this.message,});

  @override
  List<Object?> get props => <Object?>[message];
}


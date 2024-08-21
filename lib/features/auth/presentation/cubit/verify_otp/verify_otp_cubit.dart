import 'dart:developer';

import 'package:country_picker/country_picker.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/utils/values/strings.dart';
import '../../../domain/usecases/verify_otp_usecase.dart';
import '../../../domain/entities/verify_otp_response.dart';

part 'verify_otp_states.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  final VerifyOtpUseCase verifyOtpUseCase;

  VerifyOtpCubit(this.verifyOtpUseCase) : super(const VerifyOtpInitialState());

  VerifyOtpResponse? data;
  bool? isRegister;
  String? mobileWithCallingCode;
  String? mobile;
  String? callingCode;
  Country? country;

  Future<void> fVerifyOtp({
    required String mobile,
    required String code,
  }) async {
    emit(const VerifyOtpLoadingState());
    final Either<Failure, VerifyOtpResponse> eitherResult =
        await verifyOtpUseCase(VerifyOtpParams(
      mobile: mobile,
      code: code,
    ));
    eitherResult.fold((Failure failure) {
      emit(VerifyOtpErrorState(
          message: failure.message ?? Strings.pleaseTryAgainLater));
    }, (VerifyOtpResponse response) {
      data = response;
      log('response.data.user ${response.data.user}');
      isRegister = response.data.user == null && response.message == 'register';
      log('isRegister $isRegister');
      emit(VerifyOtpSuccessState(value: response, isRegister: isRegister!));
    });
  }

  void setMobileNumberWithCallingCode(String mobileNumber) {
    mobileWithCallingCode = mobileNumber;
    emit(const VerifyOtpInitialState());
  }

  void setMobileNumber(String mobileNumber) {
    mobile = mobileNumber;
    emit(const VerifyOtpInitialState());
  }

  void setCallingCode(String value) {
    callingCode = value;
    emit(const VerifyOtpInitialState());
  }

  void setCountry(Country country) {
    this.country = country;
    emit(const VerifyOtpInitialState());
  }
}

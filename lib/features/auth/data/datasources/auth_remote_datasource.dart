import '../../../../core/error/exceptions.dart';
import '../../../../injection_container.dart';
import '../../../../core/api/dio_consumer.dart';
import '../../domain/usecases/update_register_usecase.dart';
import '../models/register_model.dart';
import '../../domain/usecases/register_usecase.dart';
import '../models/login_email_model.dart';
import '../../domain/usecases/login_email_usecase.dart';
import '../models/update_register_model.dart';
import '../models/verify_email_model.dart';
import '../../domain/usecases/verify_email_usecase.dart';
import '../models/check_mobile_model.dart';
import '../../domain/usecases/check_mobile_usecase.dart';
import '../models/verify_otp_model.dart';
import '../../domain/usecases/verify_otp_usecase.dart';
import '../models/delete_account_model.dart';
import '../models/verify_reset_password_model.dart';
import '../../domain/usecases/verify_reset_password_usecase.dart';
import '../models/reset_password_model.dart';
import '../../domain/usecases/reset_password_usecase.dart';
import '../models/confirm_reset_password_model.dart';
import '../../domain/usecases/confirm_reset_password_usecase.dart';
import '../models/logout_model.dart';

abstract class AuthRemoteDataSource {
  Future<DeleteAccountModel> deleteAccount();

  Future<VerifyResetPasswordModel> verifyResetPassword({
    required VerifyResetPasswordParams params,
  });

  Future<ResetPasswordModel> resetPassword({
    required ResetPasswordParams params,
  });

  Future<ConfirmResetPasswordModel> confirmResetPassword({
    required ConfirmResetPasswordParams params,
  });

  Future<LogoutModel> logout();

  Future<UpdateRegisterModel> updateRegister({
    required UpdateRegisterParams params,
  });

  Future<RegisterModel> register({
    required RegisterParams params,
  });

  Future<LoginEmailModel> loginEmail({
    required LoginEmailParams params,
  });

  Future<VerifyEmailModel> verifyEmail({
    required VerifyEmailParams params,
  });


  Future<CheckMobileModel> checkMobile({
    required CheckMobileParams params,
  });

  Future<VerifyOtpModel> verifyOtp({
    required VerifyOtpParams params,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {

  @override
  Future<DeleteAccountModel> deleteAccount() async {
    try {
      const String deleteAccountEndpoint = '/${ApiConstants.doctors}/${ApiConstants.version}/auth/delete/account';
      final dynamic response = await dioConsumer.post(
        deleteAccountEndpoint,
      );

      if(response['success'] == true){
        return DeleteAccountModel.fromJson(response);
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }


  @override
  Future<VerifyResetPasswordModel> verifyResetPassword({
    required VerifyResetPasswordParams params,
  }) async {
    try {
      const String verifyResetPasswordEndpoint = '/${ApiConstants.doctors}/${ApiConstants.version}/auth/reset/verify';
      final dynamic response = await dioConsumer.post(
        verifyResetPasswordEndpoint,
        body: params.toJson(),
      );

      if(response['success'] == true){
        return VerifyResetPasswordModel.fromJson(response);
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }


  @override
  Future<ResetPasswordModel> resetPassword({
    required ResetPasswordParams params,
  }) async {
    try {
      const String resetPasswordEndpoint = '/${ApiConstants.doctors}/${ApiConstants.version}/auth/reset/password';
      final dynamic response = await dioConsumer.post(
        resetPasswordEndpoint,
        body: params.toJson(),
      );

      if(response['success'] == true){
        return ResetPasswordModel.fromJson(response);
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }


  @override
  Future<ConfirmResetPasswordModel> confirmResetPassword({
    required ConfirmResetPasswordParams params,
  }) async {
    try {
      const String confirmResetPasswordEndpoint = '/${ApiConstants.doctors}/${ApiConstants.version}/auth/reset/confirmation';
      final dynamic response = await dioConsumer.post(
        confirmResetPasswordEndpoint,
        body: params.toJson(),
      );

      if(response['success'] == true){
        return ConfirmResetPasswordModel.fromJson(response);
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }


  @override
  Future<LogoutModel> logout() async {
    try {
      const String logoutEndpoint = '/${ApiConstants.doctors}/${ApiConstants.version}/auth/logout';
      final dynamic response = await dioConsumer.post(
        logoutEndpoint,
      );

      if(response['success'] == true){
        return LogoutModel.fromJson(response);
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }


  @override
  Future<UpdateRegisterModel> updateRegister({
    required UpdateRegisterParams params,
  }) async {
    try {
      const String updateRegisterEndpoint = '/${ApiConstants.doctors}/${ApiConstants.version}/auth/register/update';
      final dynamic response = await dioConsumer.post(
        updateRegisterEndpoint,
        formData: await params.toJson(),
      );
      if(response['success'] == true){
        return UpdateRegisterModel.fromJson(response);
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<RegisterModel> register({
    required RegisterParams params,
  }) async {
    try {
      const String registerEndpoint = '/${ApiConstants.doctors}/${ApiConstants.version}/auth/register';
      final dynamic response = await dioConsumer.post(
        registerEndpoint,
        formData: await params.toJson(),
      );
      if(response['success'] == true){
        return RegisterModel.fromJson(response);
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }


  @override
  Future<LoginEmailModel> loginEmail({
    required LoginEmailParams params,
  }) async {
    try {
      const String loginEmailEndpoint = '/${ApiConstants.doctors}/${ApiConstants.version}/auth/login/mail';
      final dynamic response = await dioConsumer.post(
        loginEmailEndpoint,
        body: params.toJson(),
      );
      if(response['success'] == true){
        return LoginEmailModel.fromJson(response);
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }


  @override
  Future<VerifyEmailModel> verifyEmail({
    required VerifyEmailParams params,
  }) async {
    try {
      const String verifyEmailEndpoint = '/${ApiConstants.doctors}/${ApiConstants.version}/auth/verify/email';
      final dynamic response = await dioConsumer.post(
        verifyEmailEndpoint,
        body: params.toJson(),
      );
      if(response['success'] == true){
        return VerifyEmailModel.fromJson(response);
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }


  @override
  Future<CheckMobileModel> checkMobile({
    required CheckMobileParams params,
  }) async {
    try {
      const String checkMobileEndpoint = '/${ApiConstants.doctors}/${ApiConstants.version}/auth/check/mobile';
      final dynamic response = await dioConsumer.post(
        checkMobileEndpoint,
        body: params.toJson(),
      );
      if(response['success'] == true){
        return CheckMobileModel.fromJson(response);
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }


  @override
  Future<VerifyOtpModel> verifyOtp({
    required VerifyOtpParams params,
  }) async {
    try {
      const String verifyOtpEndpoint = '/${ApiConstants.doctors}/${ApiConstants.version}/auth/verify/otp';
      final dynamic response = await dioConsumer.post(
        verifyOtpEndpoint,
        body: params.toJson(),
      );

      if(response['success'] == true){
        return VerifyOtpModel.fromJson(response);
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }

}

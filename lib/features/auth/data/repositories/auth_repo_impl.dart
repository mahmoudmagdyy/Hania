import 'package:dartz/dartz.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/log_utils.dart' as log;
import '../../../../core/error/failures.dart';
import '../../../../injection_container.dart';
import '../../../../core/utils/values/strings.dart';
import '../../data/datasources/auth_remote_datasource.dart';
import '../../domain/entities/update_register_response.dart';
import '../../domain/repositories/auth_repo.dart';
import '../../domain/entities/register_response.dart';
import '../../domain/usecases/register_usecase.dart';
import '../../domain/entities/login_email_response.dart';
import '../../domain/usecases/login_email_usecase.dart';
import '../../domain/entities/verify_email_response.dart';
import '../../domain/usecases/save_user_type_usecase.dart';
import '../../domain/usecases/update_register_usecase.dart';
import '../../domain/usecases/verify_email_usecase.dart';
import '../../domain/entities/check_mobile_response.dart';
import '../../domain/usecases/check_mobile_usecase.dart';
import '../../domain/entities/verify_otp_response.dart' as otp;
import '../../domain/usecases/verify_otp_usecase.dart';


import '../../domain/entities/delete_account_response.dart';
import '../../domain/entities/verify_reset_password_response.dart';
import '../../domain/usecases/verify_reset_password_usecase.dart';
import '../../domain/entities/reset_password_response.dart';
import '../../domain/usecases/reset_password_usecase.dart';
import '../../domain/entities/confirm_reset_password_response.dart';
import '../../domain/usecases/confirm_reset_password_usecase.dart';
import '../../domain/entities/logout_response.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl({
    required this.remote,
  });

  /// Impl

  @override
  Future<Either<Failure, UserType>> getUserType({required NoParams params}) async {
    try {
      UserType userType = sharedPreferences.getUserType();
      return Right<Failure, UserType>(userType);
    } on AppException catch (error) {
      log.Log.e('[getUserType] [${error.runtimeType.toString()}] ---- ${error.message}');
      return Left<Failure, UserType>(error.toFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> saveUserType({required SaveUserTypeParams params}) async {
    try {
      bool result = await sharedPreferences.saveUserType(params.type);
      return Right<Failure, bool>(result);
    } on AppException catch (error) {
      log.Log.e('[saveUserType] [${error.runtimeType.toString()}] ---- ${error.message}');
      return Left<Failure, bool>(error.toFailure());
    }
  }
  @override
  Future<Either<Failure, UserType>> getUserRole({required NoParams params}) async {
    try {
      UserType userType = sharedPreferences.getUserRole();
      return Right<Failure, UserType>(userType);
    } on AppException catch (error) {
      log.Log.e('[getUserRole] [${error.runtimeType.toString()}] ---- ${error.message}');
      return Left<Failure, UserType>(error.toFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> saveUserRole({required SaveUserTypeParams params}) async {
    try {
      bool result = await sharedPreferences.saveUserRole(params.type);
      return Right<Failure, bool>(result);
    } on AppException catch (error) {
      log.Log.e('[saveUserRole] [${error.runtimeType.toString()}] ---- ${error.message}');
      return Left<Failure, bool>(error.toFailure());
    }
  }

  @override
  Future<Either<Failure, UpdateRegisterResponse>> updateRegister({required UpdateRegisterParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final UpdateRegisterResponse response = await remote.updateRegister(params: params);
        return Right<Failure, UpdateRegisterResponse>(response);
      } on AppException catch (error) {
        log.Log.e('[updateRegister] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, UpdateRegisterResponse>(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: Strings.noInternetConnection));
    }
  }

  @override
  Future<Either<Failure, RegisterResponse>> register({required RegisterParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final RegisterResponse response = await remote.register(params: params);
        secureStorage.saveAccessToken(response.data.token);
        return Right<Failure, RegisterResponse>(response);
      } on AppException catch (error) {
        log.Log.e('[register] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, RegisterResponse>(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: Strings.noInternetConnection));
    }
  }


  @override
  Future<Either<Failure, LoginEmailResponse>> loginEmail({required LoginEmailParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final LoginEmailResponse response = await remote.loginEmail(params: params);
        secureStorage.saveAccessToken(response.data.token);
        return Right<Failure, LoginEmailResponse>(response);
      } on AppException catch (error) {
        log.Log.e('[loginEmail] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, LoginEmailResponse>(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: Strings.noInternetConnection));
    }
  }


  @override
  Future<Either<Failure, VerifyEmailResponse>> verifyEmail({required VerifyEmailParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final VerifyEmailResponse response = await remote.verifyEmail(params: params);
        return Right<Failure, VerifyEmailResponse>(response);
      } on AppException catch (error) {
        log.Log.e('[verifyEmail] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, VerifyEmailResponse>(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: Strings.noInternetConnection));
    }
  }


  @override
  Future<Either<Failure, CheckMobileResponse>> checkMobile({required CheckMobileParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final CheckMobileResponse response = await remote.checkMobile(params: params);
        return Right<Failure, CheckMobileResponse>(response);
      } on AppException catch (error) {
        log.Log.e('[checkMobile] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, CheckMobileResponse>(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: Strings.noInternetConnection));
    }
  }


  @override
  Future<Either<Failure, otp.VerifyOtpResponse>> verifyOtp({required VerifyOtpParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final otp.VerifyOtpResponse response = await remote.verifyOtp(params: params);
        secureStorage.saveAccessToken(response.data.token);
        return Right<Failure, otp.VerifyOtpResponse>(response);
      } on AppException catch (error) {
        log.Log.e('[verifyOtp] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, otp.VerifyOtpResponse>(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: Strings.noInternetConnection));
    }
  }


  @override
  Future<Either<Failure, DeleteAccountResponse>> deleteAccount({required NoParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final DeleteAccountResponse response = await remote.deleteAccount();
        await secureStorage.saveAccessToken(null);
        return Right<Failure, DeleteAccountResponse>(response);
      } on AppException catch (error) {
        log.Log.e('[deleteAccount] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, DeleteAccountResponse>(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: Strings.noInternetConnection));
    }
  }


  @override
  Future<Either<Failure, VerifyResetPasswordResponse>> verifyResetPassword({required VerifyResetPasswordParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final VerifyResetPasswordResponse response = await remote.verifyResetPassword(params: params);
        return Right<Failure, VerifyResetPasswordResponse>(response);
      } on AppException catch (error) {
        log.Log.e('[verifyResetPassword] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, VerifyResetPasswordResponse>(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: Strings.noInternetConnection));
    }
  }


  @override
  Future<Either<Failure, ResetPasswordResponse>> resetPassword({required ResetPasswordParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final ResetPasswordResponse response = await remote.resetPassword(params: params);
        return Right<Failure, ResetPasswordResponse>(response);
      } on AppException catch (error) {
        log.Log.e('[resetPassword] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, ResetPasswordResponse>(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: Strings.noInternetConnection));
    }
  }


  @override
  Future<Either<Failure, ConfirmResetPasswordResponse>> confirmResetPassword({required ConfirmResetPasswordParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final ConfirmResetPasswordResponse response = await remote.confirmResetPassword(params: params);
        return Right<Failure, ConfirmResetPasswordResponse>(response);
      } on AppException catch (error) {
        log.Log.e('[confirmResetPassword] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, ConfirmResetPasswordResponse>(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: Strings.noInternetConnection));
    }
  }


  @override
  Future<Either<Failure, LogoutResponse>> logout({required NoParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final LogoutResponse response = await remote.logout();
        await secureStorage.saveAccessToken(null);
        return Right<Failure, LogoutResponse>(response);
      } on AppException catch (error) {
        log.Log.e('[logout] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, LogoutResponse>(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: Strings.noInternetConnection));
    }
  }


}

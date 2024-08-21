import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/delete_account_response.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/verify_reset_password_response.dart';
import '../../domain/usecases/verify_reset_password_usecase.dart';
import '../../domain/entities/reset_password_response.dart';
import '../../domain/usecases/reset_password_usecase.dart';
import '../../domain/entities/confirm_reset_password_response.dart';
import '../../domain/usecases/confirm_reset_password_usecase.dart';
import '../../domain/entities/logout_response.dart';
import '../../../../core/utils/enums.dart';
import '../../domain/entities/register_response.dart';
import '../../domain/usecases/register_usecase.dart';
import '../../domain/entities/login_email_response.dart';
import '../../domain/usecases/login_email_usecase.dart';
import '../../domain/entities/verify_email_response.dart';
import '../../domain/usecases/verify_email_usecase.dart';
import '../../domain/entities/check_mobile_response.dart';
import '../../domain/usecases/check_mobile_usecase.dart';
import '../../domain/entities/verify_otp_response.dart';
import '../../domain/usecases/verify_otp_usecase.dart';
import '../entities/update_register_response.dart';
import '../usecases/save_user_type_usecase.dart';
import '../usecases/update_register_usecase.dart';

abstract class AuthRepository {
  Future<Either<Failure, DeleteAccountResponse>> deleteAccount({
    required NoParams params,
  });


  Future<Either<Failure, VerifyResetPasswordResponse>> verifyResetPassword({
    required VerifyResetPasswordParams params,
  });


  Future<Either<Failure, ResetPasswordResponse>> resetPassword({
    required ResetPasswordParams params,
  });


  Future<Either<Failure, ConfirmResetPasswordResponse>> confirmResetPassword({
    required ConfirmResetPasswordParams params,
  });


  Future<Either<Failure, LogoutResponse>> logout({
    required NoParams params,
  });


  Future<Either<Failure, UpdateRegisterResponse>> updateRegister({
    required UpdateRegisterParams params,
  });


  Future<Either<Failure, RegisterResponse>> register({
    required RegisterParams params,
  });


  Future<Either<Failure, LoginEmailResponse>> loginEmail({
    required LoginEmailParams params,
  });


  Future<Either<Failure, VerifyEmailResponse>> verifyEmail({
    required VerifyEmailParams params,
  });


  Future<Either<Failure, CheckMobileResponse>> checkMobile({
    required CheckMobileParams params,
  });


  Future<Either<Failure, VerifyOtpResponse>> verifyOtp({
    required VerifyOtpParams params,
  });


  Future<Either<Failure, UserType>> getUserType({
    required NoParams params,
  });

  Future<Either<Failure, bool>> saveUserType({
    required SaveUserTypeParams params,
  });
  Future<Either<Failure, UserType>> getUserRole({
    required NoParams params,
  });

  Future<Either<Failure, bool>> saveUserRole({
    required SaveUserTypeParams params,
  });

}

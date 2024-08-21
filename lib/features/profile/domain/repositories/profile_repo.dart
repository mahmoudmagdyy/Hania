import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/update_doctor_title_response.dart';
import '../../domain/usecases/update_doctor_title_usecase.dart';
import '../../domain/entities/get_doctor_title_response.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/update_profile_response.dart';
import '../../domain/usecases/update_profile_usecase.dart';
import '../../domain/entities/update_email_send_code_response.dart';
import '../../domain/usecases/update_email_send_code_usecase.dart';
import '../../domain/entities/update_email_verify_code_response.dart';
import '../../domain/usecases/update_email_verify_code_usecase.dart';
import '../../domain/entities/update_mobile_send_code_response.dart';
import '../../domain/usecases/update_mobile_send_code_usecase.dart';
import '../../domain/entities/update_mobile_verify_code_response.dart';
import '../../domain/usecases/update_mobile_verify_code_usecase.dart';
import '../../domain/entities/get_profile_response.dart';
import '../../domain/entities/edit_bio_response.dart';
import '../../domain/usecases/edit_bio_usecase.dart';
import '../entities/get_bio_response.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UpdateDoctorTitleResponse>> updateDoctorTitle({
    required UpdateDoctorTitleParams params,
  });


  Future<Either<Failure, GetDoctorTitleResponse>> getDoctorTitle({
    required NoParams params,
  });


  Future<Either<Failure, UpdateProfileResponse>> updateProfile({
    required UpdateProfileParams params,
  });


  Future<Either<Failure, UpdateEmailSendCodeResponse>> updateEmailSendCode({
    required UpdateEmailSendCodeParams params,
  });


  Future<Either<Failure, UpdateEmailVerifyCodeResponse>> updateEmailVerifyCode({
    required UpdateEmailVerifyCodeParams params,
  });


  Future<Either<Failure, UpdateMobileSendCodeResponse>> updateMobileSendCode({
    required UpdateMobileSendCodeParams params,
  });


  Future<Either<Failure, UpdateMobileVerifyCodeResponse>> updateMobileVerifyCode({
    required UpdateMobileVerifyCodeParams params,
  });


  Future<Either<Failure, GetProfileResponse>> getProfile({
    required NoParams params,
  });

  Future<Either<Failure, EditBioResponse>> editBio({
    required EditBioParams params,
  });

  Future<Either<Failure, GetBioResponse>> getBio({
    required NoParams params,
  });


}

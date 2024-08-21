import 'package:dartz/dartz.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../core/utils/log_utils.dart' as log;
import '../../../../core/error/failures.dart';
import '../../../../injection_container.dart';
import '../../../../core/utils/values/strings.dart';
import '../../data/datasources/profile_remote_datasource.dart';
import '../../domain/entities/get_bio_response.dart';
import '../../domain/repositories/profile_repo.dart';
import '../../domain/entities/get_profile_response.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/edit_bio_response.dart';
import '../../domain/usecases/edit_bio_usecase.dart';


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

import '../../domain/entities/update_doctor_title_response.dart';
import '../../domain/usecases/update_doctor_title_usecase.dart';
import '../../domain/entities/get_doctor_title_response.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remote;

  ProfileRepositoryImpl({
    required this.remote,
  });

  /// Impl


  @override
  Future<Either<Failure, GetProfileResponse>> getProfile({required NoParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final GetProfileResponse response = await remote.getProfile();
        return Right<Failure, GetProfileResponse>(response);
      } on AppException catch (error) {
        log.Log.e('[getProfile] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, GetProfileResponse>(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: Strings.noInternetConnection));
    }
  }


  @override
  Future<Either<Failure, EditBioResponse>> editBio({required EditBioParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final EditBioResponse response = await remote.editBio(params: params);
        return Right<Failure, EditBioResponse>(response);
      } on AppException catch (error) {
        log.Log.e('[editBio] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, EditBioResponse>(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: Strings.noInternetConnection));
    }
  }

  @override
  Future<Either<Failure, GetBioResponse>> getBio({required NoParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final GetBioResponse response = await remote.getBio();
        return Right<Failure, GetBioResponse>(response);
      } on AppException catch (error) {
        log.Log.e('[getBio] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, GetBioResponse>(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: Strings.noInternetConnection));
    }
  }



  @override
  Future<Either<Failure, UpdateProfileResponse>> updateProfile({required UpdateProfileParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final UpdateProfileResponse response = await remote.updateProfile(params: params);
        return Right<Failure, UpdateProfileResponse>(response);
      } on AppException catch (error) {
        log.Log.e('[updateProfile] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, UpdateProfileResponse>(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: Strings.noInternetConnection));
    }
  }


  @override
  Future<Either<Failure, UpdateEmailSendCodeResponse>> updateEmailSendCode({required UpdateEmailSendCodeParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final UpdateEmailSendCodeResponse response = await remote.updateEmailSendCode(params: params);
        return Right<Failure, UpdateEmailSendCodeResponse>(response);
      } on AppException catch (error) {
        log.Log.e('[updateEmailSendCode] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, UpdateEmailSendCodeResponse>(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: Strings.noInternetConnection));
    }
  }


  @override
  Future<Either<Failure, UpdateEmailVerifyCodeResponse>> updateEmailVerifyCode({required UpdateEmailVerifyCodeParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final UpdateEmailVerifyCodeResponse response = await remote.updateEmailVerifyCode(params: params);
        return Right<Failure, UpdateEmailVerifyCodeResponse>(response);
      } on AppException catch (error) {
        log.Log.e('[updateEmailVerifyCode] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, UpdateEmailVerifyCodeResponse>(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: Strings.noInternetConnection));
    }
  }


  @override
  Future<Either<Failure, UpdateMobileSendCodeResponse>> updateMobileSendCode({required UpdateMobileSendCodeParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final UpdateMobileSendCodeResponse response = await remote.updateMobileSendCode(params: params);
        return Right<Failure, UpdateMobileSendCodeResponse>(response);
      } on AppException catch (error) {
        log.Log.e('[updateMobileSendCode] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, UpdateMobileSendCodeResponse>(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: Strings.noInternetConnection));
    }
  }


  @override
  Future<Either<Failure, UpdateMobileVerifyCodeResponse>> updateMobileVerifyCode({required UpdateMobileVerifyCodeParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final UpdateMobileVerifyCodeResponse response = await remote.updateMobileVerifyCode(params: params);
        return Right<Failure, UpdateMobileVerifyCodeResponse>(response);
      } on AppException catch (error) {
        log.Log.e('[updateMobileVerifyCode] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, UpdateMobileVerifyCodeResponse>(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: Strings.noInternetConnection));
    }
  }



  @override
  Future<Either<Failure, UpdateDoctorTitleResponse>> updateDoctorTitle({required UpdateDoctorTitleParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final UpdateDoctorTitleResponse response = await remote.updateDoctorTitle(params: params);
        return Right<Failure, UpdateDoctorTitleResponse>(response);
      } on AppException catch (error) {
        log.Log.e('[updateDoctorTitle] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, UpdateDoctorTitleResponse>(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: Strings.noInternetConnection));
    }
  }


  @override
  Future<Either<Failure, GetDoctorTitleResponse>> getDoctorTitle({required NoParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final GetDoctorTitleResponse response = await remote.getDoctorTitle();
        return Right<Failure, GetDoctorTitleResponse>(response);
      } on AppException catch (error) {
        log.Log.e('[getDoctorTitle] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, GetDoctorTitleResponse>(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: Strings.noInternetConnection));
    }
  }


}

import '../../../../core/error/exceptions.dart';
import '../../../../injection_container.dart';
import '../../../../core/api/dio_consumer.dart';
import '../models/get_bio_model.dart';
import '../models/get_profile_model.dart';
import '../models/edit_bio_model.dart';
import '../../domain/usecases/edit_bio_usecase.dart';

import '../models/update_profile_model.dart';
import '../../domain/usecases/update_profile_usecase.dart';

import '../models/update_email_send_code_model.dart';
import '../../domain/usecases/update_email_send_code_usecase.dart';

import '../models/update_email_verify_code_model.dart';
import '../../domain/usecases/update_email_verify_code_usecase.dart';

import '../models/update_mobile_send_code_model.dart';
import '../../domain/usecases/update_mobile_send_code_usecase.dart';

import '../models/update_mobile_verify_code_model.dart';
import '../../domain/usecases/update_mobile_verify_code_usecase.dart';

import '../models/update_doctor_title_model.dart';
import '../../domain/usecases/update_doctor_title_usecase.dart';

import '../models/get_doctor_title_model.dart';

abstract class ProfileRemoteDataSource {
  Future<UpdateDoctorTitleModel> updateDoctorTitle({
    required UpdateDoctorTitleParams params,
  });

  Future<GetDoctorTitleModel> getDoctorTitle();

  Future<UpdateProfileModel> updateProfile({
    required UpdateProfileParams params,
  });

  Future<UpdateEmailSendCodeModel> updateEmailSendCode({
    required UpdateEmailSendCodeParams params,
  });

  Future<UpdateEmailVerifyCodeModel> updateEmailVerifyCode({
    required UpdateEmailVerifyCodeParams params,
  });

  Future<UpdateMobileSendCodeModel> updateMobileSendCode({
    required UpdateMobileSendCodeParams params,
  });

  Future<UpdateMobileVerifyCodeModel> updateMobileVerifyCode({
    required UpdateMobileVerifyCodeParams params,
  });

  Future<GetProfileModel> getProfile();

  Future<EditBioModel> editBio({
    required EditBioParams params,
  });

  Future<GetBioModel> getBio();

}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {

  @override
  Future<UpdateDoctorTitleModel> updateDoctorTitle({
    required UpdateDoctorTitleParams params,
  }) async {
    try {
      const String updateDoctorTitleEndpoint = '/${ApiConstants.doctors}/${ApiConstants.version}/profile/title/edit';
      final dynamic response = await dioConsumer.post(
        updateDoctorTitleEndpoint,
        body: params.toJson(),
      );

      if(response['success'] == true){
        return UpdateDoctorTitleModel.fromJson(response);
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }


  @override
  Future<GetDoctorTitleModel> getDoctorTitle() async {
    try {
      const String getDoctorTitleEndpoint = '/${ApiConstants.doctors}/${ApiConstants.version}/profile/title/edit';
      final dynamic response = await dioConsumer.get(
        getDoctorTitleEndpoint,
      );

      if(response['success'] == true){
        return GetDoctorTitleModel.fromJson(response);
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }


  @override
  Future<UpdateProfileModel> updateProfile({
    required UpdateProfileParams params,
  }) async {
    try {
      const String updateProfileEndpoint = '/${ApiConstants.doctors}/${ApiConstants.version}/profile/edit';
      final dynamic response = await dioConsumer.post(
        updateProfileEndpoint,
        body: params.toJson(),
      );

      if(response['success'] == true){
        return UpdateProfileModel.fromJson(response);
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }


  @override
  Future<UpdateEmailSendCodeModel> updateEmailSendCode({
    required UpdateEmailSendCodeParams params,
  }) async {
    try {
      const String updateEmailSendCodeEndpoint = '/${ApiConstants.doctors}/${ApiConstants.version}/profile/edit/mail';
      final dynamic response = await dioConsumer.post(
        updateEmailSendCodeEndpoint,
        body: params.toJson(),
      );

      if(response['success'] == true){
        return UpdateEmailSendCodeModel.fromJson(response);
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }


  @override
  Future<UpdateEmailVerifyCodeModel> updateEmailVerifyCode({
    required UpdateEmailVerifyCodeParams params,
  }) async {
    try {
      const String updateEmailVerifyCodeEndpoint = '/${ApiConstants.doctors}/${ApiConstants.version}/profile/verify/email';
      final dynamic response = await dioConsumer.post(
        updateEmailVerifyCodeEndpoint,
        body: params.toJson(),
      );

      if(response['success'] == true){
        return UpdateEmailVerifyCodeModel.fromJson(response);
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }


  @override
  Future<UpdateMobileSendCodeModel> updateMobileSendCode({
    required UpdateMobileSendCodeParams params,
  }) async {
    try {
      const String updateMobileSendCodeEndpoint = '/${ApiConstants.doctors}/${ApiConstants.version}/profile/edit/mobile';
      final dynamic response = await dioConsumer.post(
        updateMobileSendCodeEndpoint,
        body: params.toJson(),
      );

      if(response['success'] == true){
        return UpdateMobileSendCodeModel.fromJson(response);
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }


  @override
  Future<UpdateMobileVerifyCodeModel> updateMobileVerifyCode({
    required UpdateMobileVerifyCodeParams params,
  }) async {
    try {
      const String updateMobileVerifyCodeEndpoint = '/${ApiConstants.doctors}/${ApiConstants.version}/profile/verify/mobile';
      final dynamic response = await dioConsumer.post(
        updateMobileVerifyCodeEndpoint,
        body: params.toJson(),
      );

      if(response['success'] == true){
        return UpdateMobileVerifyCodeModel.fromJson(response);
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }


  @override
  Future<GetProfileModel> getProfile() async {
    try {
      const String getProfileEndpoint = '/${ApiConstants.doctors}/${ApiConstants.version}/auth/check/status';
      final dynamic response = await dioConsumer.get(
        getProfileEndpoint,
      );

      if(response['success'] == true){
        return GetProfileModel.fromJson(response);
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }


  @override
  Future<EditBioModel> editBio({
    required EditBioParams params,
  }) async {
    try {
      const String editBioEndpoint = '/${ApiConstants.doctors}/${ApiConstants.version}/profile/info/edit';
      final dynamic response = await dioConsumer.post(
        editBioEndpoint,
        body: params.toJson(),
      );

      if(response['success'] == true){
        return EditBioModel.fromJson(response);
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<GetBioModel> getBio() async {
    try {
      const String getBioEndpoint = '/${ApiConstants.doctors}/${ApiConstants.version}/profile/info/edit';
      final dynamic response = await dioConsumer.get(
        getBioEndpoint,
      );

      if(response['success'] == true){
        return GetBioModel.fromJson(response);
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }

}

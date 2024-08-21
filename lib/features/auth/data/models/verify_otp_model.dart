import '../../../profile/data/models/get_profile_model.dart';
import '../../domain/entities/verify_otp_response.dart';

class VerifyOtpModel extends VerifyOtpResponse {
  const VerifyOtpModel({
    required super.success,
    required super.message,
    required super.data,
  });

  factory VerifyOtpModel.fromJson(Map<String, dynamic> json) =>
      VerifyOtpModel(
        success: json['success'],
        message: json['message'],
        data: VerifyOtpDataModel.fromJson(json['data']),
      );
}


class VerifyOtpDataModel extends VerifyOtpData {
  const VerifyOtpDataModel({
    required super.token,
    required super.user,
    required super.mobile,
    required super.socialUser,
  });

  factory VerifyOtpDataModel.fromJson(Map<String, dynamic> json) => VerifyOtpDataModel(
    token: json['token'] ?? '',
    user: json['user'] != null? UserModel.fromJson(json['user']) : null,
    mobile: json['mobile'] ?? '',
    socialUser: json['social_user'] != null? SocialUserModel.fromJson(json['social_user']) : null,
  );

}
import '../../../profile/data/models/get_profile_model.dart';
import '../../domain/entities/login_email_response.dart';

class LoginEmailModel extends LoginEmailResponse {
  const LoginEmailModel({
    required super.success,
    required super.message,
    required super.data,
  });

  factory LoginEmailModel.fromJson(Map<String, dynamic> json) =>
      LoginEmailModel(
        success: json['success'],
        message: json['message'],
        data: LoginEmailDataModel.fromJson(json['data']),
      );
}


class LoginEmailDataModel extends LoginEmailData {
  const LoginEmailDataModel({
    required super.token,
    required super.user,
    required super.mobile,
    required super.socialUser,
  });

  factory LoginEmailDataModel.fromJson(Map<String, dynamic> json) => LoginEmailDataModel(
    token: json['token'] ?? '',
    user: json['user'] != null? UserModel.fromJson(json['user']) : null,
    mobile: json['mobile'] ?? '',
    socialUser: json['social_user'] != null? SocialUserModel.fromJson(json['social_user']) : null,
  );

}
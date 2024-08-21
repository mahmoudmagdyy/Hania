import '../../../profile/data/models/get_profile_model.dart';
import '../../domain/entities/register_response.dart';

class RegisterModel extends RegisterResponse {
  const RegisterModel({
    required super.success,
    required super.message,
    required super.data,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      RegisterModel(
        success: json['success'],
        message: json['message'],
        data: RegisterDataModel.fromJson(json['data']),
      );
}


class RegisterDataModel extends RegisterData {
  const RegisterDataModel({
    required super.token,
    required super.user,
    required super.mobile,
    required super.socialUser,
  });

  factory RegisterDataModel.fromJson(Map<String, dynamic> json) => RegisterDataModel(
    token: json['token'] ?? '',
    user: json['user'] != null? UserModel.fromJson(json['user']) : null,
    mobile: json['mobile'] ?? '',
    socialUser: json['social_user'] != null? SocialUserModel.fromJson(json['social_user']) : null,
  );

}


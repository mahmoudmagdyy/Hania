import '../../domain/entities/update_profile_response.dart';

class UpdateProfileModel extends UpdateProfileResponse {
  const UpdateProfileModel({
    required super.success,
    required super.message,
  });

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) =>
      UpdateProfileModel(
        success: json['success'],
        message: json['message'],
      );
}


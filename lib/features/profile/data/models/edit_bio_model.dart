import '../../domain/entities/edit_bio_response.dart';

class EditBioModel extends EditBioResponse {
  const EditBioModel({
    required super.success,
    required super.message,
  });

  factory EditBioModel.fromJson(Map<String, dynamic> json) =>
      EditBioModel(
        success: json['success'],
        message: json['message'],
      );
}




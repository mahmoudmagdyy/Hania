import '../../domain/entities/add_media_response.dart';

class AddMediaModel extends AddMediaResponse {
  const AddMediaModel({
    required super.success,
    required super.message,
    required super.data,
  });

  factory AddMediaModel.fromJson(Map<String, dynamic> json) => AddMediaModel(
        success: json['success'],
        message: json['message'],
        data: (json['data'] as List<dynamic>)
            .map((dynamic e) => AddMediaResponseDataModel.fromJson(e))
            .toList(),
      );
}

class AddMediaResponseDataModel extends AddMediaResponseData {
  const AddMediaResponseDataModel({
    required super.path,
    required super.url,
  });

  factory AddMediaResponseDataModel.fromJson(Map<String, dynamic> json) =>
      AddMediaResponseDataModel(
        path: json['path'] ?? '',
        url: json['url'] ?? '',
      );
}

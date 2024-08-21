import '../../domain/entities/delete_account_response.dart';

class DeleteAccountModel extends DeleteAccountResponse {
  const DeleteAccountModel({
    required super.success,
    required super.message,
  });

  factory DeleteAccountModel.fromJson(Map<String, dynamic> json) =>
      DeleteAccountModel(
        success: json['success'],
        message: json['message'],
      );
}




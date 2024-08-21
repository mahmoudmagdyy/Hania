import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/update_email_send_code_response.dart';
import '../repositories/profile_repo.dart';


class UpdateEmailSendCodeUseCase extends UseCase<UpdateEmailSendCodeResponse, UpdateEmailSendCodeParams> {
  final ProfileRepository repository;

  UpdateEmailSendCodeUseCase({required this.repository});

  @override
  Future<Either<Failure, UpdateEmailSendCodeResponse>> call(UpdateEmailSendCodeParams params) async {
    return await repository.updateEmailSendCode(params: params);
  }
}


class UpdateEmailSendCodeParams extends Equatable {
  final String? email;

  const UpdateEmailSendCodeParams({
    required this.email,
  });

  Map<String, dynamic> toJson() => {
    'email': email,
  };

  @override
  List<Object?> get props => <Object?>[
    email,
  ];

}




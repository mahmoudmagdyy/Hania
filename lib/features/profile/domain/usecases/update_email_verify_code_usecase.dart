import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/update_email_verify_code_response.dart';
import '../repositories/profile_repo.dart';


class UpdateEmailVerifyCodeUseCase extends UseCase<UpdateEmailVerifyCodeResponse, UpdateEmailVerifyCodeParams> {
  final ProfileRepository repository;

  UpdateEmailVerifyCodeUseCase({required this.repository});

  @override
  Future<Either<Failure, UpdateEmailVerifyCodeResponse>> call(UpdateEmailVerifyCodeParams params) async {
    return await repository.updateEmailVerifyCode(params: params);
  }
}


class UpdateEmailVerifyCodeParams extends Equatable {
  final String? email;
  final String? code;

  const UpdateEmailVerifyCodeParams({
    required this.email,
    required this.code,
  });

  Map<String, dynamic> toJson() => {
    'email': email,
    'code': code,
  };

  @override
  List<Object?> get props => <Object?>[
    email,
    code,
  ];

}




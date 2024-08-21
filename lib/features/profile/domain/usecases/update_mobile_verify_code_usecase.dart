import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/update_mobile_verify_code_response.dart';
import '../repositories/profile_repo.dart';


class UpdateMobileVerifyCodeUseCase extends UseCase<UpdateMobileVerifyCodeResponse, UpdateMobileVerifyCodeParams> {
  final ProfileRepository repository;

  UpdateMobileVerifyCodeUseCase({required this.repository});

  @override
  Future<Either<Failure, UpdateMobileVerifyCodeResponse>> call(UpdateMobileVerifyCodeParams params) async {
    return await repository.updateMobileVerifyCode(params: params);
  }
}


class UpdateMobileVerifyCodeParams extends Equatable {
  final String? mobile;
  final String? code;

  const UpdateMobileVerifyCodeParams({
    required this.mobile,
    required this.code,
  });

  Map<String, dynamic> toJson() => {
    'mobile': mobile,
    'code': code,
  };

  @override
  List<Object?> get props => <Object?>[
    mobile,
    code,
  ];

}




import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/update_mobile_send_code_response.dart';
import '../repositories/profile_repo.dart';


class UpdateMobileSendCodeUseCase extends UseCase<UpdateMobileSendCodeResponse, UpdateMobileSendCodeParams> {
  final ProfileRepository repository;

  UpdateMobileSendCodeUseCase({required this.repository});

  @override
  Future<Either<Failure, UpdateMobileSendCodeResponse>> call(UpdateMobileSendCodeParams params) async {
    return await repository.updateMobileSendCode(params: params);
  }
}


class UpdateMobileSendCodeParams extends Equatable {
  final String? mobile;
  final String? callingCode;

  const UpdateMobileSendCodeParams({
    required this.mobile,
    required this.callingCode,
  });

  Map<String, dynamic> toJson() => {
    'mobile': mobile,
    'calling_code': callingCode,
  };

  @override
  List<Object?> get props => <Object?>[
    mobile,
    callingCode,
  ];

}




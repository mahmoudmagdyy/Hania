import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/verify_otp_response.dart';
import '../repositories/auth_repo.dart';


class VerifyOtpUseCase extends UseCase<VerifyOtpResponse, VerifyOtpParams> {
  final AuthRepository repository;

  VerifyOtpUseCase({required this.repository});

  @override
  Future<Either<Failure, VerifyOtpResponse>> call(VerifyOtpParams params) async {
    return await repository.verifyOtp(params: params);
  }
}


class VerifyOtpParams extends Equatable {
  final String? mobile;
  final String? code;

  const VerifyOtpParams({
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




import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/logout_response.dart';
import '../repositories/auth_repo.dart';


class LogoutUseCase extends UseCase<LogoutResponse, NoParams> {
  final AuthRepository repository;

  LogoutUseCase({required this.repository});

  @override
  Future<Either<Failure, LogoutResponse>> call(NoParams params) async {
    return await repository.logout(params: params);
  }
}




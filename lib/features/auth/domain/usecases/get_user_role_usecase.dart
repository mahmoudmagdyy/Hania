import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/enums.dart';
import '../repositories/auth_repo.dart';


class GetUserRoleUseCase extends UseCase<UserType, NoParams> {
  final AuthRepository repository;

  GetUserRoleUseCase({required this.repository});

  @override
  Future<Either<Failure, UserType>> call(NoParams params) async {
    return await repository.getUserType(params: params);
  }
}





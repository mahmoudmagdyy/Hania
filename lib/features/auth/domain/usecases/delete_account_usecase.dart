import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/delete_account_response.dart';
import '../repositories/auth_repo.dart';


class DeleteAccountUseCase extends UseCase<DeleteAccountResponse, NoParams> {
  final AuthRepository repository;

  DeleteAccountUseCase({required this.repository});

  @override
  Future<Either<Failure, DeleteAccountResponse>> call(NoParams params) async {
    return await repository.deleteAccount(params: params);
  }
}




import 'package:dartz/dartz.dart';

import '/features/auth/domain/usecases/save_user_type_usecase.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repo.dart';

class SaveUserRoleUseCase extends UseCase<bool, SaveUserTypeParams> {
  final AuthRepository repository;

  SaveUserRoleUseCase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(SaveUserTypeParams params) async {
    return await repository.saveUserRole(params: params);
  }
}


// class SaveUserTypeParams extends Equatable {
//   final UserType type;
//
//   const SaveUserTypeParams({
//     required this.type,
//   });
//
//   @override
//   List<Object?> get props => <Object?>[
//     type,
//   ];
//
// }
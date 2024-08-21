import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/get_profile_response.dart';
import '../repositories/profile_repo.dart';


class GetProfileUseCase extends UseCase<GetProfileResponse, NoParams> {
  final ProfileRepository repository;

  GetProfileUseCase({required this.repository});

  @override
  Future<Either<Failure, GetProfileResponse>> call(NoParams params) async {
    return await repository.getProfile(params: params);
  }
}




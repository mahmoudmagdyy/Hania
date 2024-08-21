import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/get_bio_response.dart';
import '../repositories/profile_repo.dart';


class GetBioUseCase extends UseCase<GetBioResponse, NoParams> {
  final ProfileRepository repository;

  GetBioUseCase({required this.repository});

  @override
  Future<Either<Failure, GetBioResponse>> call(NoParams params) async {
    return await repository.getBio(params: params);
  }
}




import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/get_doctor_title_response.dart';
import '../repositories/profile_repo.dart';


class GetDoctorTitleUseCase extends UseCase<GetDoctorTitleResponse, NoParams> {
  final ProfileRepository repository;

  GetDoctorTitleUseCase({required this.repository});

  @override
  Future<Either<Failure, GetDoctorTitleResponse>> call(NoParams params) async {
    return await repository.getDoctorTitle(params: params);
  }
}




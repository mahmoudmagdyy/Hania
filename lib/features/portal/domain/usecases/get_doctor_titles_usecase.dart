import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/pagination/entity/pagination_response.dart';
import '../../../../core/pagination/usecase/pagination_usecase.dart';
import '../entities/get_doctor_titles_response.dart';
import '../repositories/portal_repo.dart';


class GetDoctorTitlesUseCase extends PaginationUseCase<DoctorTitle> {
  final PortalRepository repository;

  GetDoctorTitlesUseCase({required this.repository});

  @override
  Future<Either<Failure, PaginationResponse<DoctorTitle>>> call(PaginationParams params) async {
    return await repository.getDoctorTitles(params: params);
  }
}


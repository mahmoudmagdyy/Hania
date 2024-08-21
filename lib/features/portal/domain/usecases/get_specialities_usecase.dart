import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/pagination/entity/pagination_response.dart';
import '../../../../core/pagination/usecase/additional_pagination_params.dart';
import '../../../../core/pagination/usecase/pagination_usecase.dart';
import '../entities/get_specialities_response.dart';
import '../repositories/portal_repo.dart';

class GetSpecialitiesUseCase extends PaginationUseCase<Speciality> {
  final PortalRepository repository;

    GetSpecialitiesUseCase({required this.repository});

  @override
  Future<Either<Failure, PaginationResponse<Speciality>>> call(
      PaginationParams params) {
    return repository.getSpecialities(params: params);
  }
}

class GetSpecialitiesParams extends AdditionalPaginationParams {
  final String? orderBy;
  final String? orderDir;
  final int? filterParentId;

  const GetSpecialitiesParams({
    this.orderBy,
    this.orderDir,
    this.filterParentId,
  });

  @override
  Map<String, dynamic> toJson() => {
    'orderBy': orderBy,
    'orderDir': orderDir,
    'filters[parent_id]': filterParentId,
  };

  @override
  List<Object?> get props => <Object?>[
    orderBy,
    orderDir,
    filterParentId,
  ];
}

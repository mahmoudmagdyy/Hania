import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/pagination/entity/pagination_response.dart';
import '../../../../core/pagination/usecase/additional_pagination_params.dart';
import '../../../../core/pagination/usecase/pagination_usecase.dart';
import '../entities/get_governments_response.dart';
import '../repositories/portal_repo.dart';


class GetGovernmentsUseCase extends PaginationUseCase<Government> {
  final PortalRepository repository;

  GetGovernmentsUseCase({required this.repository});

  @override
  Future<Either<Failure, PaginationResponse<Government>>> call(PaginationParams params) async {
    return await repository.getGovernments(params: params);
  }
}


class GetGovernmentsParams extends AdditionalPaginationParams {
  final int? countryId;

  const GetGovernmentsParams({
    this.countryId,
  });

  @override
  Map<String, dynamic> toJson() => {
    'country_id': countryId,
  };

  @override
  List<Object?> get props => <Object?>[
    countryId,
  ];

}




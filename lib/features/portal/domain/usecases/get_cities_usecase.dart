import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/pagination/entity/pagination_response.dart';
import '../../../../core/pagination/usecase/additional_pagination_params.dart';
import '../../../../core/pagination/usecase/pagination_usecase.dart';
import '../entities/get_cities_response.dart';
import '../repositories/portal_repo.dart';


class GetCitiesUseCase extends PaginationUseCase<City> {
  final PortalRepository repository;

  GetCitiesUseCase({required this.repository});

  @override
  Future<Either<Failure, PaginationResponse<City>>> call(PaginationParams params) async {
    return await repository.getCities(params: params);
  }
}


class GetCitiesParams extends AdditionalPaginationParams {
  final int? cityId;

  const GetCitiesParams({
    required this.cityId,
  });

  @override
  Map<String, dynamic> toJson() => {
    'city_id': cityId,
  };

  @override
  List<Object?> get props => <Object?>[
    cityId,
  ];

}




import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/pagination/entity/pagination_response.dart';
import '../../../../core/pagination/usecase/pagination_usecase.dart';
import '../entities/get_countries_response.dart';
import '../repositories/portal_repo.dart';


class GetCountriesUseCase extends PaginationUseCase<Country> {
  final PortalRepository repository;

  GetCountriesUseCase({required this.repository});

  @override
  Future<Either<Failure, PaginationResponse<Country>>> call(PaginationParams params) async {
    return await repository.getCountries(params: params);
  }
}



class GetCountriesParams extends Equatable {
  final int? countryId;

  const GetCountriesParams({
    required this.countryId,
  });

  Map<String, dynamic> toJson() => {
    'country_id': countryId,
  };

  @override
  List<Object?> get props => <Object?>[
    countryId,
  ];

}




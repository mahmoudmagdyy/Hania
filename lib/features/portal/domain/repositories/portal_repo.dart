import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/pagination/entity/pagination_response.dart';
import '../../../../core/pagination/usecase/pagination_usecase.dart';
import '../entities/add_media_response.dart';
import '../entities/get_cities_response.dart';
import '../entities/get_countries_response.dart';
import '../entities/get_doctor_titles_response.dart';
import '../entities/get_governments_response.dart';
import '../entities/get_specialities_response.dart';
import '../entities/get_static_pages_response.dart';
import '../usecases/add_media_usecase.dart';
import '../usecases/get_static_pages_usecase.dart';

abstract class PortalRepository {
  Future<Either<Failure, PaginationResponse<Country>>> getCountries({
    required PaginationParams params,
  });


  Future<Either<Failure, PaginationResponse<City>>> getCities({
    required PaginationParams params,
  });


  Future<Either<Failure, GetStaticPagesResponse>> getStaticPages({
    required GetStaticPagesParams params,
  });


  Future<Either<Failure, PaginationResponse<Speciality>>> getSpecialities({
    required PaginationParams params,
  });

  Future<Either<Failure, AddMediaResponse>> addMedia({
    required AddMediaParams params,
  });

  Future<Either<Failure, PaginationResponse<DoctorTitle>>> getDoctorTitles({
    required PaginationParams params,
  });

  Future<Either<Failure, PaginationResponse<Government>>> getGovernments({
    required PaginationParams params,
  });


}

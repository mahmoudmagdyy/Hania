import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../core/pagination/entity/pagination_response.dart';
import '../../../../core/pagination/usecase/pagination_usecase.dart';
import '../../../../core/utils/log_utils.dart';
import '../../../../core/error/failures.dart';
import '../../../../injection_container.dart';
import '../../../../core/utils/values/strings.dart';
import '../../data/datasources/portal_remote_datasource.dart';
import '../../domain/entities/add_media_response.dart';
import '../../domain/entities/get_doctor_titles_response.dart';
import '../../domain/entities/get_governments_response.dart';
import '../../domain/repositories/portal_repo.dart';
import '../../domain/entities/get_countries_response.dart';
import '../../domain/usecases/add_media_usecase.dart';
import '../../domain/entities/get_cities_response.dart';
import '../../domain/entities/get_static_pages_response.dart';
import '../../domain/usecases/get_static_pages_usecase.dart';
import '../../domain/entities/get_specialities_response.dart';


class PortalRepositoryImpl implements PortalRepository {
  final PortalRemoteDataSource remote;

  PortalRepositoryImpl({
    required this.remote,
  });

  /// Impl
  @override
  Future<Either<Failure, AddMediaResponse>> addMedia({required AddMediaParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final AddMediaResponse response = await remote.addMedia(params: params);
        return Right<Failure, AddMediaResponse>(response);
      } on AppException catch (error) {
        Log.e('[addMedia] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, AddMediaResponse>(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: Strings.noInternetConnection));
    }
  }

  @override
  Future<Either<Failure, PaginationResponse<Country>>> getCountries({required PaginationParams params}) async {
    try {
      final PaginationResponse<Country> response = await remote.getCountries(params: params);
      return Right<Failure, PaginationResponse<Country>>(response);
    } on AppException catch (error) {
      Log.e('[getCountries] [${error.runtimeType.toString()}] ---- ${error.message}');
      return Left<Failure, PaginationResponse<Country>>(error.toFailure());
    }
  }


  @override
  Future<Either<Failure, PaginationResponse<City>>> getCities({required PaginationParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final PaginationResponse<City> response = await remote.getCities(params: params);
        return Right<Failure, PaginationResponse<City>>(response);
      } on AppException catch (error) {
        Log.e('[getCities] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, PaginationResponse<City>>(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: Strings.noInternetConnection));
    }
  }


  @override
  Future<Either<Failure, GetStaticPagesResponse>> getStaticPages({required GetStaticPagesParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final GetStaticPagesResponse response = await remote.getStaticPages(params: params);
        return Right<Failure, GetStaticPagesResponse>(response);
      } on AppException catch (error) {
        Log.e('[getStaticPages] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, GetStaticPagesResponse>(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: Strings.noInternetConnection));
    }
  }


  @override
  Future<Either<Failure, PaginationResponse<Speciality>>> getSpecialities({required PaginationParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final PaginationResponse<Speciality> response = await remote.getSpecialities(params: params);
        log('[getSpecialities] data.length: ${response.data.length}');
        log('[getSpecialities] meta.currentPage: ${response.meta.currentPage}');
        log('[getSpecialities] meta.lastPage: ${response.meta.lastPage}');
        log('[getSpecialities] meta.total: ${response.meta.total}');
        return Right<Failure, PaginationResponse<Speciality>>(response);
      } on AppException catch (error) {
        Log.e('[getSpecialities] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, PaginationResponse<Speciality>>(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: Strings.noInternetConnection));
    }
  }

  @override
  Future<Either<Failure, PaginationResponse<DoctorTitle>>> getDoctorTitles({required PaginationParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final PaginationResponse<DoctorTitle> response = await remote.getDoctorTitles(params: params);
        return Right<Failure, PaginationResponse<DoctorTitle>>(response);
      } on AppException catch (error) {
        Log.e('[getDoctorTitles] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, PaginationResponse<DoctorTitle>>(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: Strings.noInternetConnection));
    }
  }

  @override
  Future<Either<Failure, PaginationResponse<Government>>> getGovernments({required PaginationParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final PaginationResponse<Government> response = await remote.getGovernments(params: params);
        return Right<Failure, PaginationResponse<Government>>(response);
      } on AppException catch (error) {
        Log.e('[getGovernments] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, PaginationResponse<Government>>(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: Strings.noInternetConnection));
    }
  }



}


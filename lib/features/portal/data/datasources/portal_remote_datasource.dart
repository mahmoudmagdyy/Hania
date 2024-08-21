import 'package:dio/dio.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/pagination/model/pagination_model.dart';
import '../../../../core/pagination/usecase/pagination_usecase.dart';
import '../../../../injection_container.dart';
import '../../../../core/api/dio_consumer.dart';
import '../../domain/entities/get_cities_response.dart';
import '../../domain/entities/get_countries_response.dart';
import '../../domain/entities/get_doctor_titles_response.dart';
import '../../domain/entities/get_governments_response.dart';
import '../../domain/entities/get_specialities_response.dart';
import '../../domain/usecases/add_media_usecase.dart';
import '../models/add_media_model.dart';
import '../models/get_countries_model.dart';
import '../models/get_cities_model.dart';
import '../models/get_doctor_titles_model.dart';
import '../models/get_governments_model.dart';
import '../models/get_static_pages_model.dart';
import '../../domain/usecases/get_static_pages_usecase.dart';
import '../models/get_specialities_model.dart';

abstract class PortalRemoteDataSource {
  Future<PaginationModel<Country, CountryModel>> getCountries({
    required PaginationParams params,
  });

  Future<PaginationModel<City, CityModel>> getCities({
    required PaginationParams params,
  });

  Future<GetStaticPagesModel> getStaticPages({
    required GetStaticPagesParams params,
  });

  Future<PaginationModel<Speciality, SpecialityModel>> getSpecialities({
    required PaginationParams params,
  });

  Future<AddMediaModel> addMedia({
    required AddMediaParams params,
  });

  Future<PaginationModel<DoctorTitle, DoctorTitleModel>> getDoctorTitles({
    required PaginationParams params,
  });

  Future<PaginationModel<Government, GovernmentModel>> getGovernments({
    required PaginationParams params,
  });

}

class PortalRemoteDataSourceImpl implements PortalRemoteDataSource {

  @override
  Future<AddMediaModel> addMedia({
    required AddMediaParams params,
  }) async {
    const String addMediaEndpoint = '/${ApiConstants.doctors}/${ApiConstants.version}/media/add';
    try {
      FormData formData = await params.toJson();
      final dynamic response = await dioConsumer.post(
        addMediaEndpoint,
        formData: formData,
      );
      if(response['success'] == true){
        return AddMediaModel.fromJson(response);
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<PaginationModel<Country, CountryModel>> getCountries({
    required PaginationParams params,
  }) async {
    try {
      const String getCountriesEndpoint = '/${ApiConstants.portal}/${ApiConstants.version}/country';
      final dynamic response = await dioConsumer.get(
        getCountriesEndpoint,
        queryParameters: params.toJson(),
      );
      if(response['success'] == true){
        return PaginationModel.fromJson(
          json: response,
          fetchDataModel: (e) => CountryModel.fromJson(e),
        );
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }


  @override
  Future<PaginationModel<City, CityModel>> getCities({
    required PaginationParams params,
  }) async {
    try {
      const String getCitiesEndpoint = '/${ApiConstants.portal}/${ApiConstants.version}/city';
      final dynamic response = await dioConsumer.get(
        getCitiesEndpoint,
        queryParameters: params.toJson(),
      );
      if(response['success'] == true){
        return PaginationModel.fromJson(
          json: response,
          fetchDataModel: (e) => CityModel.fromJson(e),
        );
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }


  @override
  Future<GetStaticPagesModel> getStaticPages({
    required GetStaticPagesParams params,
  }) async {
    try {
      String getStaticPagesEndpoint = '/${ApiConstants.portal}/${ApiConstants.version}/screens';
      if(params.pageId != null){
        getStaticPagesEndpoint = '$getStaticPagesEndpoint/:${params.pageId}';
      } else if(params.slug != null){
        getStaticPagesEndpoint = '$getStaticPagesEndpoint/slug/:${params.slug}';
      }
      final dynamic response = await dioConsumer.get(
        getStaticPagesEndpoint,
      );
      if(response['success'] == true){
        return GetStaticPagesModel.fromJson(response);
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }


  @override
  Future<PaginationModel<Speciality, SpecialityModel>> getSpecialities({
    required PaginationParams params,
  }) async {
    try {
      const String getSpecialitiesEndpoint = '/${ApiConstants.portal}/${ApiConstants.version}/specialities';
      final dynamic response = await dioConsumer.get(
        getSpecialitiesEndpoint,
        queryParameters: params.toJson(),
      );
      if(response['success'] == true){
        return PaginationModel.fromJson(
          json: response,
          fetchDataModel: (e) => SpecialityModel.fromJson(e),
        );
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<PaginationModel<DoctorTitle, DoctorTitleModel>> getDoctorTitles({
    required PaginationParams params,
  }) async {
    try {
      const String getDoctorTitlesEndpoint = '/${ApiConstants.portal}/${ApiConstants.version}/doctor_titles';
      final dynamic response = await dioConsumer.get(
        getDoctorTitlesEndpoint,
        queryParameters: params.toJson(),
      );
      if(response['success'] == true){
        return PaginationModel.fromJson(
          json: response,
          fetchDataModel: (e) => DoctorTitleModel.fromJson(e),
        );
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<PaginationModel<Government, GovernmentModel>> getGovernments({
    required PaginationParams params,
  }) async {
    try {
      const String getGovernmentsEndpoint = '/${ApiConstants.portal}/${ApiConstants.version}/government';
      final dynamic response = await dioConsumer.get(
        getGovernmentsEndpoint,
        queryParameters: params.toJson(),
      );

      if(response['success'] == true){
        return PaginationModel.fromJson(
          json: response,
          fetchDataModel: (e) => GovernmentModel.fromJson(e),
        );
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }

}

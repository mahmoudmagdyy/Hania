import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection_container.dart';
import 'data/datasources/portal_remote_datasource.dart';
import 'data/repositories/portal_repo_impl.dart';
import 'domain/repositories/portal_repo.dart';
import 'domain/usecases/add_media_usecase.dart';
import 'domain/usecases/get_countries_usecase.dart';
import 'domain/usecases/get_doctor_titles_usecase.dart';
import 'domain/usecases/get_governments_usecase.dart';
import 'presentation/controller/add_media/add_media_cubit.dart';
import 'presentation/controller/get_countries/get_countries_cubit.dart';
import 'domain/usecases/get_cities_usecase.dart';
import 'presentation/controller/get_cities/get_cities_cubit.dart';
import 'domain/usecases/get_static_pages_usecase.dart';
import 'presentation/controller/get_doctor_titles/get_doctor_titles_cubit.dart';
import 'presentation/controller/get_governments/get_governments_cubit.dart';
import 'presentation/controller/get_static_pages/get_static_pages_cubit.dart';
import 'domain/usecases/get_specialities_usecase.dart';
import 'presentation/controller/get_specialities/get_specialities_cubit.dart';

final _sl = ServiceLocator.instance;

Future<void> initPortalFeatureInjection() async {
  ///-> Cubits
  _sl.registerLazySingleton<GetDoctorTitlesCubit>(() => GetDoctorTitlesCubit(_sl()));
  _sl.registerLazySingleton<GetCountriesCubit>(() => GetCountriesCubit(_sl()));
  _sl.registerLazySingleton<GetCitiesCubit>(() => GetCitiesCubit(_sl()));
  _sl.registerLazySingleton<GetStaticPagesCubit>(() => GetStaticPagesCubit(_sl()));
  _sl.registerLazySingleton<GetSpecialitiesCubit>(() => GetSpecialitiesCubit(_sl()));
  _sl.registerLazySingleton<AddMediaCubit>(() => AddMediaCubit(_sl()));
  _sl.registerLazySingleton<GetGovernmentsCubit>(() => GetGovernmentsCubit(_sl()));

  ///-> UseCases
  _sl.registerLazySingleton<GetDoctorTitlesUseCase>(() => GetDoctorTitlesUseCase(repository: _sl()));
  _sl.registerLazySingleton<GetCountriesUseCase>(() => GetCountriesUseCase(repository: _sl()));
  _sl.registerLazySingleton<GetCitiesUseCase>(() => GetCitiesUseCase(repository: _sl()));
  _sl.registerLazySingleton<GetStaticPagesUseCase>(() => GetStaticPagesUseCase(repository: _sl()));
  _sl.registerLazySingleton<GetSpecialitiesUseCase>(() => GetSpecialitiesUseCase(repository: _sl()));
  _sl.registerLazySingleton<AddMediaUseCase>(() => AddMediaUseCase(repository: _sl()));
  _sl.registerLazySingleton<GetGovernmentsUseCase>(() => GetGovernmentsUseCase(repository: _sl()));

  ///-> Repository
  _sl.registerLazySingleton<PortalRepository>(() => PortalRepositoryImpl(remote: _sl()));

  ///-> DataSource
  _sl.registerLazySingleton<PortalRemoteDataSource>(() => PortalRemoteDataSourceImpl());
}

  ///-> BlocProvider
List<BlocProvider> get portalBlocs => <BlocProvider>[
  BlocProvider<GetDoctorTitlesCubit>(
    create: (BuildContext context) => _sl<GetDoctorTitlesCubit>(),
  ),

  BlocProvider<GetCountriesCubit>(
    create: (BuildContext context) => _sl<GetCountriesCubit>()..fPagination(page: 1),
  ),

  BlocProvider<GetCitiesCubit>(
    create: (BuildContext context) => _sl<GetCitiesCubit>(),
  ),

  BlocProvider<GetStaticPagesCubit>(
    create: (BuildContext context) => _sl<GetStaticPagesCubit>(),
  ),

  BlocProvider<GetSpecialitiesCubit>(
    create: (BuildContext context) => _sl<GetSpecialitiesCubit>(),
  ),

  BlocProvider<AddMediaCubit>(
    create: (BuildContext context) => _sl<AddMediaCubit>(),
  ),

  BlocProvider<GetGovernmentsCubit>(
    create: (BuildContext context) => _sl<GetGovernmentsCubit>(),
  ),
];

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection_container.dart';
import '../tabBar/presentation/cubit/tabbar_cubit/tabbar_cubit.dart';
import 'controller/bottom_nav_bar/bottom_nav_bar_cubit.dart';

final _sl = ServiceLocator.instance;

Future<void> initHomeFeatureInjection() async {
  ///-> Cubits
  _sl.registerLazySingleton<BottomNavBarCubit>(() => BottomNavBarCubit());

  ///-> UseCases
  // _sl.registerLazySingleton<GetDoctorTitlesUseCase>(() => GetDoctorTitlesUseCase(repository: _sl()));

  ///-> Repository
  // _sl.registerLazySingleton<PortalRepository>(() => PortalRepositoryImpl(remote: _sl()));

  ///-> DataSource
  // _sl.registerLazySingleton<PortalRemoteDataSource>(() => PortalRemoteDataSourceImpl());
}

  ///-> BlocProvider
List<BlocProvider> get homeBlocs => <BlocProvider>[
  BlocProvider<BottomNavBarCubit>(
    create: (BuildContext context) => _sl<BottomNavBarCubit>(),
  ),
  BlocProvider<TabbarCubit>(
    create: (BuildContext context) => _sl<TabbarCubit>(),
  ),
];

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/features/laundry/presentation/cubit/loundary_orders/loundary_orders_cubit.dart';
import '../../injection_container.dart';

final _sl = ServiceLocator.instance;

Future<void> initLaundryFeatureInjection() async {
  ///-> Cubits
  _sl.registerLazySingleton<LaundryOrdersCubit>(() => LaundryOrdersCubit());

  ///-> UseCases
  // _sl.registerLazySingleton<GetDoctorTitlesUseCase>(() => GetDoctorTitlesUseCase(repository: _sl()));

  ///-> Repository
  // _sl.registerLazySingleton<PortalRepository>(() => PortalRepositoryImpl(remote: _sl()));

  ///-> DataSource
  // _sl.registerLazySingleton<PortalRemoteDataSource>(() => PortalRemoteDataSourceImpl());
}

///-> BlocProvider
List<BlocProvider> get laundryBlocs => <BlocProvider>[
      BlocProvider<LaundryOrdersCubit>(
        create: (BuildContext context) => _sl<LaundryOrdersCubit>(),
      ),
    ];

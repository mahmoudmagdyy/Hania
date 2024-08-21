// import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'data/datasources/notifications_remote_datasource.dart';
// import 'data/repositories/notifications_repo_impl.dart';
// import 'domain/repositories/notifications_repo.dart';
// import 'domain/usecases/read_notification_usecase.dart';
// import 'presentation/controller/read_notification/read_notification_cubit.dart';
// import 'domain/usecases/read_all_notifications_usecase.dart';
// import 'presentation/controller/read_all_notifications/read_all_notifications_cubit.dart';
// import 'domain/usecases/get_notifications_usecase.dart';
// import 'presentation/controller/get_notifications/get_notifications_cubit.dart';

// final _sl = ServiceLocator.instance;

Future<void> initNotificationsFeatureInjection() async {
  // ///-> Cubits
  // _sl.registerLazySingleton<ReadNotificationCubit>(() => ReadNotificationCubit(_sl()));
  // _sl.registerLazySingleton<ReadAllNotificationsCubit>(() => ReadAllNotificationsCubit(_sl()));
  // _sl.registerLazySingleton<GetNotificationsCubit>(() => GetNotificationsCubit(_sl()));

  // ///-> UseCases
  // _sl.registerLazySingleton<ReadNotificationUseCase>(() => ReadNotificationUseCase(repository: _sl()));
  // _sl.registerLazySingleton<ReadAllNotificationsUseCase>(() => ReadAllNotificationsUseCase(repository: _sl()));
  // _sl.registerLazySingleton<GetNotificationsUseCase>(() => GetNotificationsUseCase(repository: _sl()));

  // ///-> Repository
  // _sl.registerLazySingleton<NotificationsRepository>(() => NotificationsRepositoryImpl(remote: _sl()));

  // ///-> DataSource
  // _sl.registerLazySingleton<NotificationsRemoteDataSource>(() => NotificationsRemoteDataSourceImpl());
}

///-> BlocProvider
List<BlocProvider> get notificationsBlocs => <BlocProvider>[
      // BlocProvider<ReadNotificationCubit>(
      //   create: (BuildContext context) => _sl<ReadNotificationCubit>(),
      // ),

      // BlocProvider<ReadAllNotificationsCubit>(
      //   create: (BuildContext context) => _sl<ReadAllNotificationsCubit>(),
      // ),

      // BlocProvider<GetNotificationsCubit>(
      //   create: (BuildContext context) => _sl<GetNotificationsCubit>(),
      // ),
    ];

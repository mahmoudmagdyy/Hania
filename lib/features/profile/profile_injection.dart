import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection_container.dart';
import 'data/datasources/profile_remote_datasource.dart';
import 'data/repositories/profile_repo_impl.dart';
import 'domain/repositories/profile_repo.dart';
import 'domain/usecases/update_doctor_title_usecase.dart';
import 'presentation/cubit/update_doctor_title/update_doctor_title_cubit.dart';
import 'domain/usecases/get_doctor_title_usecase.dart';
import 'presentation/cubit/get_doctor_title/get_doctor_title_cubit.dart';
import 'domain/usecases/update_profile_usecase.dart';
import 'presentation/cubit/update_profile/update_profile_cubit.dart';
import 'domain/usecases/update_email_send_code_usecase.dart';
import 'presentation/cubit/update_email_send_code/update_email_send_code_cubit.dart';
import 'domain/usecases/update_email_verify_code_usecase.dart';
import 'presentation/cubit/update_email_verify_code/update_email_verify_code_cubit.dart';
import 'domain/usecases/update_mobile_send_code_usecase.dart';
import 'presentation/cubit/update_mobile_send_code/update_mobile_send_code_cubit.dart';
import 'domain/usecases/update_mobile_verify_code_usecase.dart';
import 'presentation/cubit/update_mobile_verify_code/update_mobile_verify_code_cubit.dart';
import 'domain/usecases/get_bio_usecase.dart';
import 'domain/usecases/get_profile_usecase.dart';
import 'presentation/cubit/get_bio/get_bio_cubit.dart';
import 'presentation/cubit/get_profile/get_profile_cubit.dart';
import 'domain/usecases/edit_bio_usecase.dart';
import 'presentation/cubit/edit_bio/edit_bio_cubit.dart';

final _sl = ServiceLocator.instance;

Future<void> initProfileFeatureInjection() async {
  ///-> Cubits
  _sl.registerLazySingleton<UpdateDoctorTitleCubit>(() => UpdateDoctorTitleCubit(_sl()));
  _sl.registerLazySingleton<GetDoctorTitleCubit>(() => GetDoctorTitleCubit(_sl()));
  _sl.registerLazySingleton<UpdateProfileCubit>(() => UpdateProfileCubit(_sl()));
  _sl.registerLazySingleton<UpdateEmailSendCodeCubit>(() => UpdateEmailSendCodeCubit(_sl()));
  _sl.registerLazySingleton<UpdateEmailVerifyCodeCubit>(() => UpdateEmailVerifyCodeCubit(_sl()));
  _sl.registerLazySingleton<UpdateMobileSendCodeCubit>(() => UpdateMobileSendCodeCubit(_sl()));
  _sl.registerLazySingleton<UpdateMobileVerifyCodeCubit>(() => UpdateMobileVerifyCodeCubit(_sl()));
  _sl.registerLazySingleton<GetProfileCubit>(() => GetProfileCubit(_sl()));
  _sl.registerLazySingleton<EditBioCubit>(() => EditBioCubit(_sl()));
  _sl.registerLazySingleton<GetBioCubit>(() => GetBioCubit(_sl()));

  ///-> UseCases
  _sl.registerLazySingleton<UpdateDoctorTitleUseCase>(() => UpdateDoctorTitleUseCase(repository: _sl()));
  _sl.registerLazySingleton<GetDoctorTitleUseCase>(() => GetDoctorTitleUseCase(repository: _sl()));
  _sl.registerLazySingleton<UpdateProfileUseCase>(() => UpdateProfileUseCase(repository: _sl()));
  _sl.registerLazySingleton<UpdateEmailSendCodeUseCase>(() => UpdateEmailSendCodeUseCase(repository: _sl()));
  _sl.registerLazySingleton<UpdateEmailVerifyCodeUseCase>(() => UpdateEmailVerifyCodeUseCase(repository: _sl()));
  _sl.registerLazySingleton<UpdateMobileSendCodeUseCase>(() => UpdateMobileSendCodeUseCase(repository: _sl()));
  _sl.registerLazySingleton<UpdateMobileVerifyCodeUseCase>(() => UpdateMobileVerifyCodeUseCase(repository: _sl()));
  _sl.registerLazySingleton<GetProfileUseCase>(() => GetProfileUseCase(repository: _sl()));
  _sl.registerLazySingleton<EditBioUseCase>(() => EditBioUseCase(repository: _sl()));
  _sl.registerLazySingleton<GetBioUseCase>(() => GetBioUseCase(repository: _sl()));

  ///-> Repository
  _sl.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl(remote: _sl()));

  ///-> DataSource
  _sl.registerLazySingleton<ProfileRemoteDataSource>(() => ProfileRemoteDataSourceImpl());
}

  ///-> BlocProvider
List<BlocProvider> get profileBlocs => <BlocProvider>[
  BlocProvider<UpdateDoctorTitleCubit>(
    create: (BuildContext context) => _sl<UpdateDoctorTitleCubit>(),
  ),

  BlocProvider<GetDoctorTitleCubit>(
    create: (BuildContext context) => _sl<GetDoctorTitleCubit>(),
  ),

  BlocProvider<UpdateProfileCubit>(
    create: (BuildContext context) => _sl<UpdateProfileCubit>(),
  ),

  BlocProvider<UpdateEmailSendCodeCubit>(
    create: (BuildContext context) => _sl<UpdateEmailSendCodeCubit>(),
  ),

  BlocProvider<UpdateEmailVerifyCodeCubit>(
    create: (BuildContext context) => _sl<UpdateEmailVerifyCodeCubit>(),
  ),

  BlocProvider<UpdateMobileSendCodeCubit>(
    create: (BuildContext context) => _sl<UpdateMobileSendCodeCubit>(),
  ),

  BlocProvider<UpdateMobileVerifyCodeCubit>(
    create: (BuildContext context) => _sl<UpdateMobileVerifyCodeCubit>(),
  ),

  BlocProvider<GetProfileCubit>(
    create: (BuildContext context) => _sl<GetProfileCubit>(),
  ),

  BlocProvider<EditBioCubit>(
    create: (BuildContext context) => _sl<EditBioCubit>(),
  ),

  BlocProvider<GetBioCubit>(
    create: (BuildContext context) => _sl<GetBioCubit>(),
  ),
];

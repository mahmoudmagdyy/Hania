import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection_container.dart';
import 'data/datasources/auth_remote_datasource.dart';
import 'data/repositories/auth_repo_impl.dart';
import 'domain/repositories/auth_repo.dart';
import 'domain/usecases/confirm_reset_password_usecase.dart';
import 'domain/usecases/delete_account_usecase.dart';
import 'domain/usecases/get_user_role_usecase.dart';
import 'domain/usecases/logout_usecase.dart';
import 'domain/usecases/reset_password_usecase.dart';
import 'domain/usecases/save_user_role.dart';
import 'domain/usecases/verify_reset_password_usecase.dart';
import 'presentation/cubit/delete_account/delete_account_cubit.dart';
import 'presentation/cubit/verify_reset_password/verify_reset_password_cubit.dart';
import 'presentation/cubit/reset_password/reset_password_cubit.dart';
import 'presentation/cubit/confirm_reset_password/confirm_reset_password_cubit.dart';
import 'presentation/cubit/logout/logout_cubit.dart';
import 'domain/usecases/get_user_type_usecase.dart';
import 'domain/usecases/register_usecase.dart';
import 'domain/usecases/save_user_type_usecase.dart';
import 'domain/usecases/update_register_usecase.dart';
import 'presentation/cubit/auto_login/auto_login_cubit.dart';
import 'presentation/cubit/register/register_cubit.dart';
import 'domain/usecases/login_email_usecase.dart';
import 'presentation/cubit/login_email/login_email_cubit.dart';
import 'domain/usecases/verify_email_usecase.dart';
import 'presentation/cubit/update_register/update_register_cubit.dart';
import 'presentation/cubit/verify_email/verify_email_cubit.dart';
import 'domain/usecases/check_mobile_usecase.dart';
import 'presentation/cubit/check_mobile/check_mobile_cubit.dart';
import 'domain/usecases/verify_otp_usecase.dart';
import 'presentation/cubit/verify_otp/verify_otp_cubit.dart';

final _sl = ServiceLocator.instance;

Future<void> initAuthFeatureInjection() async {
  ///-> Cubits
  _sl.registerLazySingleton<ConfirmResetPasswordCubit>(() => ConfirmResetPasswordCubit(_sl()));
  _sl.registerLazySingleton<VerifyResetPasswordCubit>(() => VerifyResetPasswordCubit(_sl()));
  _sl.registerLazySingleton<ResetPasswordCubit>(() => ResetPasswordCubit(_sl()));
  _sl.registerLazySingleton<LogoutCubit>(() => LogoutCubit(_sl()));
  _sl.registerLazySingleton<DeleteAccountCubit>(() => DeleteAccountCubit(_sl()));
  _sl.registerLazySingleton<UpdateRegisterCubit>(() => UpdateRegisterCubit(_sl()));
  _sl.registerLazySingleton<RegisterCubit>(() => RegisterCubit(_sl()));
  _sl.registerLazySingleton<LoginEmailCubit>(() => LoginEmailCubit(_sl()));
  _sl.registerLazySingleton<VerifyEmailCubit>(() => VerifyEmailCubit(_sl()));
  _sl.registerLazySingleton<CheckMobileCubit>(() => CheckMobileCubit(_sl()));
  _sl.registerLazySingleton<VerifyOtpCubit>(() => VerifyOtpCubit(_sl()));
  _sl.registerLazySingleton<AutoLoginCubit>(() => AutoLoginCubit(
    getUserTypeUseCase: _sl(),
    saveUserTypeUseCase: _sl(), getUserRoleUseCase:  _sl(), saveUserRoleUseCase:  _sl(),
  ));

  ///-> UseCases
  _sl.registerLazySingleton<ConfirmResetPasswordUseCase>(() => ConfirmResetPasswordUseCase(repository: _sl()));
  _sl.registerLazySingleton<VerifyResetPasswordUseCase>(() => VerifyResetPasswordUseCase(repository: _sl()));
  _sl.registerLazySingleton<ResetPasswordUseCase>(() => ResetPasswordUseCase(repository: _sl()));
  _sl.registerLazySingleton<LogoutUseCase>(() => LogoutUseCase(repository: _sl()));
  _sl.registerLazySingleton<DeleteAccountUseCase>(() => DeleteAccountUseCase(repository: _sl()));
  _sl.registerLazySingleton<UpdateRegisterUseCase>(() => UpdateRegisterUseCase(repository: _sl()));
  _sl.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(repository: _sl()));
  _sl.registerLazySingleton<LoginEmailUseCase>(() => LoginEmailUseCase(repository: _sl()));
  _sl.registerLazySingleton<VerifyEmailUseCase>(() => VerifyEmailUseCase(repository: _sl()));
  _sl.registerLazySingleton<CheckMobileUseCase>(() => CheckMobileUseCase(repository: _sl()));
  _sl.registerLazySingleton<VerifyOtpUseCase>(() => VerifyOtpUseCase(repository: _sl()));
  _sl.registerLazySingleton<GetUserTypeUseCase>(() => GetUserTypeUseCase(repository: _sl()));
  _sl.registerLazySingleton<GetUserRoleUseCase>(() => GetUserRoleUseCase(repository: _sl()));
  _sl.registerLazySingleton<SaveUserTypeUseCase>(() => SaveUserTypeUseCase(repository: _sl()));
  _sl.registerLazySingleton<SaveUserRoleUseCase>(() => SaveUserRoleUseCase(repository: _sl()));

  ///-> Repository
  _sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(remote: _sl()));

  ///-> DataSource
  _sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl());
}

  ///-> BlocProvider
List<BlocProvider> get authBlocs => <BlocProvider>[

  BlocProvider<DeleteAccountCubit>(
    create: (BuildContext context) => _sl<DeleteAccountCubit>(),
  ),

  BlocProvider<VerifyResetPasswordCubit>(
    create: (BuildContext context) => _sl<VerifyResetPasswordCubit>(),
  ),

  BlocProvider<ResetPasswordCubit>(
    create: (BuildContext context) => _sl<ResetPasswordCubit>(),
  ),

  BlocProvider<ConfirmResetPasswordCubit>(
    create: (BuildContext context) => _sl<ConfirmResetPasswordCubit>(),
  ),

  BlocProvider<LogoutCubit>(
    create: (BuildContext context) => _sl<LogoutCubit>(),
  ),

  BlocProvider<UpdateRegisterCubit>(
    create: (BuildContext context) => _sl<UpdateRegisterCubit>(),
  ),

  BlocProvider<RegisterCubit>(
    create: (BuildContext context) => _sl<RegisterCubit>(),
  ),

  BlocProvider<LoginEmailCubit>(
    create: (BuildContext context) => _sl<LoginEmailCubit>(),
  ),

  BlocProvider<VerifyEmailCubit>(
    create: (BuildContext context) => _sl<VerifyEmailCubit>(),
  ),

  BlocProvider<CheckMobileCubit>(
    create: (BuildContext context) => _sl<CheckMobileCubit>(),
  ),

  BlocProvider<VerifyOtpCubit>(
    create: (BuildContext context) => _sl<VerifyOtpCubit>(),
  ),

  BlocProvider<AutoLoginCubit>(
    create: (BuildContext context) => _sl<AutoLoginCubit>(),
  ),
];

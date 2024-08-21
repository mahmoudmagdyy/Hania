import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../injection_container.dart';
import '../../../../profile/domain/entities/get_profile_response.dart';
import '../../../../profile/presentation/cubit/get_profile/get_profile_cubit.dart';
import '../../../domain/usecases/get_user_type_usecase.dart';
import '../../../domain/usecases/save_user_type_usecase.dart';

part 'auto_login_state.dart';

class AutoLoginCubit extends Cubit<AutoLoginState> {
  final GetUserTypeUseCase getUserTypeUseCase;
  final GetUserTypeUseCase getUserRoleUseCase;
  final SaveUserTypeUseCase saveUserTypeUseCase;
  final SaveUserTypeUseCase saveUserRoleUseCase;
  AutoLoginCubit( {
    required this.getUserRoleUseCase,
    required this.saveUserRoleUseCase,
    required this.getUserTypeUseCase,
    required this.saveUserTypeUseCase,
  }) : super(const AutoLoginState());

  UserType userType = UserType.firstOpen;

  Future<void> getUserType() async {
    final Either<Failure, UserType> result = await getUserTypeUseCase(NoParams());
    await Future<void>.delayed(const Duration(milliseconds: 1750), (){
      result.fold((Failure fail) {
        emit(AutoLoginState(message: fail.message, userType: userType));
      }, (UserType value){
        userType = value;
        emit(AutoLoginState(userType: userType));
      });
    });
  }
  Future<void> getUserRole() async {
    final Either<Failure, UserType> result = await getUserRoleUseCase(NoParams());
    await Future<void>.delayed(const Duration(milliseconds: 1750), (){
      result.fold((Failure fail) {
        emit(AutoLoginState(message: fail.message, userType: userType));
      }, (UserType value){
        userType = value;
        emit(AutoLoginState(userType: userType));
      });
    });
  }

  Future<void> saveUserType({required UserType type}) async {
    final Either<Failure, bool> result = await saveUserTypeUseCase(
      SaveUserTypeParams(type: type),
    );
    await Future<void>.delayed(const Duration(milliseconds: 500), (){
      result.fold((Failure fail) {
        emit(AutoLoginState(message: fail.message, userType: userType));
      }, (bool value){
        userType = type;
        emit(AutoLoginState(userType: userType));
      });
    });
  }
  Future<void> saveUserRole({required UserType type}) async {
    final Either<Failure, bool> result = await saveUserRoleUseCase(
      SaveUserTypeParams(type: type),
    );
    await Future<void>.delayed(const Duration(milliseconds: 500), (){
      result.fold((Failure fail) {
        emit(AutoLoginState(message: fail.message, userType: userType));
      }, (bool value){
        userType = type;
        emit(AutoLoginState(userType: userType));
      });
    });
  }


  void fLoggedPendingUser({required User? user}){
    ServiceLocator.instance<GetProfileCubit>().updateUser(user);
    saveUserType(type: UserType.pending);
  }

  void fLoggedRefusedUser({required User? user}){
    ServiceLocator.instance<GetProfileCubit>().updateUser(user);
    saveUserType(type: UserType.refused);
  }

  void fLoggedApprovedUser({required User? user}){
    ServiceLocator.instance<GetProfileCubit>().updateUser(user);
    saveUserType(type: UserType.approved);
  }

  void fLogout(){
    ServiceLocator.instance<GetProfileCubit>().updateUser(null);
    saveUserType(type: UserType.login);
  }
}

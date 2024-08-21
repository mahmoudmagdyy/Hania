part of 'update_profile_cubit.dart';


abstract class UpdateProfileState extends Equatable {

  const UpdateProfileState();

  @override
  List<Object?> get props => <Object?>[];
}

class UpdateProfileInitialState extends UpdateProfileState {
  const UpdateProfileInitialState();
}

class UpdateProfileLoadingState extends UpdateProfileState {
  const UpdateProfileLoadingState();
}

class UpdateProfileSuccessState extends UpdateProfileState {
  final String message;

  const UpdateProfileSuccessState({required this.message,});

  @override
  List<Object?> get props => <Object?>[message];

}

class UpdateProfileErrorState extends UpdateProfileState {
  final String message;

  const UpdateProfileErrorState({required this.message,});

  @override
  List<Object?> get props => <Object?>[message];
}


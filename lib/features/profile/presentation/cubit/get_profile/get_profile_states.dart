part of 'get_profile_cubit.dart';

abstract class GetProfileState extends Equatable {
  const GetProfileState();

  @override
  List<Object?> get props => <Object?>[];
}

class GetProfileInitialState extends GetProfileState {
  const GetProfileInitialState();
}

class GetProfileLoadingState extends GetProfileState {
  const GetProfileLoadingState();
}

class GetProfileSuccessState extends GetProfileState {
  final User? value;

  const GetProfileSuccessState({required this.value});

  @override
  List<Object?> get props => <Object?>[value];
}

class GetProfileErrorState extends GetProfileState {
  final String message;
  final bool isExpired;

  const GetProfileErrorState({
    required this.message,
    required this.isExpired,
  });

  @override
  List<Object?> get props => <Object?>[message];
}

class GetProfileUpdateUserState extends GetProfileState {
  final User? user;

  const GetProfileUpdateUserState({required this.user});

  @override
  List<Object?> get props => <Object?>[user];


}

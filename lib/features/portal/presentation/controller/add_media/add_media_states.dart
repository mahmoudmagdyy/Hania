part of 'add_media_cubit.dart';


abstract class AddMediaState extends Equatable {
  abstract final String id;
  const AddMediaState();

  @override
  List<Object?> get props => <Object?>[id];
}

class AddMediaInitialState extends AddMediaState {
  @override
  final String id;
  const AddMediaInitialState({required this.id});
}

class AddMediaLoadingState extends AddMediaState {
  @override
  final String id;
  const AddMediaLoadingState({required this.id});
}

class AddMediaSuccessState extends AddMediaState {
  @override
  final String id;
  final List<AddMediaResponseData> values;

  const AddMediaSuccessState({required this.values, required this.id});

  @override
  List<Object?> get props => <Object?>[values];
}

class AddMediaErrorState extends AddMediaState {
  @override
  final String id;
  final String message;

  const AddMediaErrorState({required this.message, required this.id});

  @override
  List<Object?> get props => <Object?>[message];
}
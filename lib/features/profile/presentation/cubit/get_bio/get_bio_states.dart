part of 'get_bio_cubit.dart';


abstract class GetBioState extends Equatable {

  const GetBioState();

  @override
  List<Object?> get props => <Object?>[];
}

class GetBioInitialState extends GetBioState {
  const GetBioInitialState();
}

class GetBioLoadingState extends GetBioState {
  const GetBioLoadingState();
}

class GetBioSuccessState extends GetBioState {
  final BioData? value;

  const GetBioSuccessState({required this.value});

  @override
  List<Object?> get props => <Object?>[value];
}

class GetBioErrorState extends GetBioState {
  final String message;

  const GetBioErrorState({required this.message,});

  @override
  List<Object?> get props => <Object?>[message];
}


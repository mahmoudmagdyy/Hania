part of 'edit_bio_cubit.dart';


abstract class EditBioState extends Equatable {

  const EditBioState();

  @override
  List<Object?> get props => <Object?>[];
}

class EditBioInitialState extends EditBioState {
  const EditBioInitialState();
}

class EditBioLoadingState extends EditBioState {
  const EditBioLoadingState();
}

class EditBioSuccessState extends EditBioState {
  final String message;

  const EditBioSuccessState({required this.message,});

  @override
  List<Object?> get props => <Object?>[message];

}

class EditBioErrorState extends EditBioState {
  final String message;

  const EditBioErrorState({required this.message,});

  @override
  List<Object?> get props => <Object?>[message];
}


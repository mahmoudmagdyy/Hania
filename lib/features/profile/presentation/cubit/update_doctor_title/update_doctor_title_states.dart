part of 'update_doctor_title_cubit.dart';


abstract class UpdateDoctorTitleState extends Equatable {

  const UpdateDoctorTitleState();

  @override
  List<Object?> get props => <Object?>[];
}

class UpdateDoctorTitleInitialState extends UpdateDoctorTitleState {
  const UpdateDoctorTitleInitialState();
}

class UpdateDoctorTitleLoadingState extends UpdateDoctorTitleState {
  const UpdateDoctorTitleLoadingState();
}

class UpdateDoctorTitleSuccessState extends UpdateDoctorTitleState {
  final String message;

  const UpdateDoctorTitleSuccessState({required this.message,});

  @override
  List<Object?> get props => <Object?>[message];

}

class UpdateDoctorTitleErrorState extends UpdateDoctorTitleState {
  final String message;

  const UpdateDoctorTitleErrorState({required this.message,});

  @override
  List<Object?> get props => <Object?>[message];
}


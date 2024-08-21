part of 'get_doctor_title_cubit.dart';


abstract class GetDoctorTitleState extends Equatable {

  const GetDoctorTitleState();

  @override
  List<Object?> get props => <Object?>[];
}

class GetDoctorTitleInitialState extends GetDoctorTitleState {
  const GetDoctorTitleInitialState();
}

class GetDoctorTitleLoadingState extends GetDoctorTitleState {
  const GetDoctorTitleLoadingState();
}

class GetDoctorTitleSuccessState extends GetDoctorTitleState {
  final GetDoctorTitleResponseData? value;

  const GetDoctorTitleSuccessState({required this.value});

  @override
  List<Object?> get props => <Object?>[value];
}

class GetDoctorTitleErrorState extends GetDoctorTitleState {
  final String message;

  const GetDoctorTitleErrorState({required this.message,});

  @override
  List<Object?> get props => <Object?>[message];
}


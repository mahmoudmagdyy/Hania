import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/update_doctor_title_response.dart';
import '../repositories/profile_repo.dart';


class UpdateDoctorTitleUseCase extends UseCase<UpdateDoctorTitleResponse, UpdateDoctorTitleParams> {
  final ProfileRepository repository;

  UpdateDoctorTitleUseCase({required this.repository});

  @override
  Future<Either<Failure, UpdateDoctorTitleResponse>> call(UpdateDoctorTitleParams params) async {
    return await repository.updateDoctorTitle(params: params);
  }
}


class UpdateDoctorTitleParams extends Equatable {
  final int? titleId;
  final Map<String, dynamic>? titleCert;

  const UpdateDoctorTitleParams({
    required this.titleId,
    required this.titleCert,
  });

  Map<String, dynamic> toJson() => {
    'title_id': titleId,
    'title_cert': titleCert,
  };

  @override
  List<Object?> get props => <Object?>[
    titleId,
    titleCert,
  ];

}




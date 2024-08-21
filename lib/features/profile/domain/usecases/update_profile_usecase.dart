import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../portal/domain/entities/add_media_response.dart';
import '../entities/update_profile_response.dart';
import '../repositories/profile_repo.dart';


class UpdateProfileUseCase extends UseCase<UpdateProfileResponse, UpdateProfileParams> {
  final ProfileRepository repository;

  UpdateProfileUseCase({required this.repository});

  @override
  Future<Either<Failure, UpdateProfileResponse>> call(UpdateProfileParams params) async {
    return await repository.updateProfile(params: params);
  }
}


class UpdateProfileParams extends Equatable {
  final String? dob;
  final String? gender;
  final AddMediaResponseData? photo;

  const UpdateProfileParams({
    required this.dob,
    required this.gender,
    required this.photo,
  });

  Map<String, dynamic> toJson() => {
    'dob': dob,
    'gender': gender,
    'photo': photo?.toJson(),
  };

  @override
  List<Object?> get props => <Object?>[
    dob,
    gender,
    photo,
  ];

}




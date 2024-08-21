import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/edit_bio_response.dart';
import '../repositories/profile_repo.dart';


class EditBioUseCase extends UseCase<EditBioResponse, EditBioParams> {
  final ProfileRepository repository;

  EditBioUseCase({required this.repository});

  @override
  Future<Either<Failure, EditBioResponse>> call(EditBioParams params) async {
    return await repository.editBio(params: params);
  }
}


class EditBioParams extends Equatable {
  final Map<String, dynamic>? bio;
  final Map<String, dynamic>? firstname;
  final Map<String, dynamic>? lastname;

  const EditBioParams({
    required this.bio,
    required this.firstname,
    required this.lastname,
  });

  Map<String, dynamic> toJson() => {
    'bio': bio,
    'firstname': firstname,
    'lastname': lastname,
  };

  @override
  List<Object?> get props => <Object?>[
    bio,
    firstname,
    lastname,
  ];

}




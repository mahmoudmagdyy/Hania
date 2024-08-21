import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../../../../../core/error/failures.dart';
import '../../../../../../core/usecases/usecase.dart';
import '../entities/add_media_response.dart';
import '../repositories/portal_repo.dart';


class AddMediaUseCase extends UseCase<AddMediaResponse, AddMediaParams> {
  final PortalRepository repository;

  AddMediaUseCase({required this.repository});

  @override
  Future<Either<Failure, AddMediaResponse>> call(AddMediaParams params) async {
    return await repository.addMedia(params: params);
  }
}


class AddMediaParams extends Equatable {
  final List<File> media;

  const AddMediaParams({
    required this.media,
  });

  Future<FormData> toJson() async{
    FormData formData = FormData();
    int count = 0;
    for(File file in media){
      final MultipartFile multipartFile = await MultipartFile.fromFile(
        file.path,
        filename: file.path.split('/').last,
      );
      formData.files.add(MapEntry('media[$count]', multipartFile));
      count++;
    }
    return formData;
  }

  @override
  List<Object?> get props => <Object?>[
    media,
  ];

}




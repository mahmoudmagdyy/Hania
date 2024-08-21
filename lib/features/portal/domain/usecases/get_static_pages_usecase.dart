import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/get_static_pages_response.dart';
import '../repositories/portal_repo.dart';


class GetStaticPagesUseCase extends UseCase<GetStaticPagesResponse, GetStaticPagesParams> {
  final PortalRepository repository;

  GetStaticPagesUseCase({required this.repository});

  @override
  Future<Either<Failure, GetStaticPagesResponse>> call(GetStaticPagesParams params) async {
    return await repository.getStaticPages(params: params);
  }
}


class GetStaticPagesParams extends Equatable {
  final int? pageId;
  final String? slug;

  const GetStaticPagesParams({
    required this.pageId,
    required this.slug,
  });

  Map<String, dynamic> toJson() => {
    'page_id': pageId,
    'slug': slug,
  };

  @override
  List<Object?> get props => <Object?>[
    pageId,
    slug,
  ];

}




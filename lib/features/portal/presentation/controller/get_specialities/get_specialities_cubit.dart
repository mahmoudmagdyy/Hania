import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../../../../../core/pagination/cubit/pagination_cubit.dart';
import '../../../../../core/pagination/entity/pagination_response.dart';
import '../../../../../core/pagination/usecase/additional_pagination_params.dart';
import '../../../domain/usecases/get_specialities_usecase.dart';
import '../../../domain/entities/get_specialities_response.dart';

class GetSpecialitiesCubit extends PaginationCubit<Speciality, GetSpecialitiesUseCase> {

  @override
  ScrollController scrollController = ScrollController();

  GetSpecialitiesCubit(super.useCase);

  @override
  AdditionalPaginationParams? additionalParams;

  @override
  List<Speciality> data = <Speciality>[];

  @override
  List<Speciality> dataSearch = <Speciality>[];

  @override
  bool isSearch = false;

  @override
  PaginationMeta meta = const PaginationMeta(currentPage: 1, lastPage: 1, total: 0);

  @override
  PaginationMeta metaSearch = const PaginationMeta(currentPage: 1, lastPage: 1, total: 0);

  @override
  String? term;

  @override
  Timer? debounceTimer;
}


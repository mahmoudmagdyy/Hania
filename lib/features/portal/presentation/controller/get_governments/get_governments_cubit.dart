import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../core/pagination/cubit/pagination_cubit.dart';
import '../../../../../core/pagination/entity/pagination_response.dart';
import '../../../../../core/pagination/usecase/additional_pagination_params.dart';
import '../../../domain/usecases/get_governments_usecase.dart';
import '../../../domain/entities/get_governments_response.dart';


class GetGovernmentsCubit extends PaginationCubit<Government, GetGovernmentsUseCase> {

  @override
  ScrollController scrollController = ScrollController();

  GetGovernmentsCubit(super.useCase);

  @override
  AdditionalPaginationParams? additionalParams;

  @override
  List<Government> data = <Government>[];

  @override
  List<Government> dataSearch = <Government>[];

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


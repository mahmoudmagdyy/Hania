import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../core/pagination/cubit/pagination_cubit.dart';
import '../../../../../core/pagination/entity/pagination_response.dart';
import '../../../../../core/pagination/usecase/additional_pagination_params.dart';
import '../../../domain/usecases/get_cities_usecase.dart';
import '../../../domain/entities/get_cities_response.dart';


class GetCitiesCubit extends PaginationCubit<City, GetCitiesUseCase> {

  @override
  ScrollController scrollController = ScrollController();

  GetCitiesCubit(super.useCase);

  @override
  AdditionalPaginationParams? additionalParams;

  @override
  List<City> data = <City>[];

  @override
  List<City> dataSearch = <City>[];

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


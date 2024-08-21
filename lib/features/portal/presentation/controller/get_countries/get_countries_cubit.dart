import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../core/pagination/cubit/pagination_cubit.dart';
import '../../../../../core/pagination/entity/pagination_response.dart';
import '../../../../../core/pagination/usecase/additional_pagination_params.dart';
import '../../../domain/usecases/get_countries_usecase.dart';
import '../../../domain/entities/get_countries_response.dart';

class GetCountriesCubit extends PaginationCubit<Country, GetCountriesUseCase> {

  @override
  ScrollController scrollController = ScrollController();

  GetCountriesCubit(super.useCase);

  @override
  AdditionalPaginationParams? additionalParams;

  @override
  List<Country> data = <Country>[];

  @override
  List<Country> dataSearch = <Country>[];

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
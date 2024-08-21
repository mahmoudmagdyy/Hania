import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../../../../../core/pagination/cubit/pagination_cubit.dart';
import '../../../../../core/pagination/entity/pagination_response.dart';
import '../../../../../core/pagination/usecase/additional_pagination_params.dart';
import '../../../domain/entities/get_doctor_titles_response.dart';
import '../../../domain/usecases/get_doctor_titles_usecase.dart';

class GetDoctorTitlesCubit extends PaginationCubit<DoctorTitle, GetDoctorTitlesUseCase> {

  @override
  ScrollController scrollController = ScrollController();

  GetDoctorTitlesCubit(super.useCase);

  @override
  AdditionalPaginationParams? additionalParams;

  @override
  List<DoctorTitle> data = <DoctorTitle>[];

  @override
  List<DoctorTitle> dataSearch = <DoctorTitle>[];

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



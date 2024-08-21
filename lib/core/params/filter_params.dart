import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../features/portal/domain/entities/get_cities_response.dart';
import '../../features/portal/domain/entities/get_specialities_response.dart';
import '/core/utils/app_enums.dart';

class FilterParams extends Equatable {
  final City? government;
  final Category? category;
  final City? city;
  final String? text;
  final Category? title;
  final Speciality? subSpecialty;
  final Gender? gender;
  final AvailableTimes? times;
  final Building? building;
  final String? weight;
  final bool? acceptPromo;
  final bool? firstCome;
  final int? priceFrom;
  final int? priceTo;
  final int? from;
  final int? to;
  final bool? isTop;
  final int? page;
  final bool? reachMax;
  final bool isFromSearchName;
  final SearchType searchType;
  final DoctorTypes? type;
  final SortingOptions? sort;
  final MedicalHistorySortingEnum? medSortingEnum;
  final StatusLevel? statusLevel;
  final int? patientId;
  final bool? medicalProfile;
  const FilterParams({
    this.government,
    this.city,
    this.text,
    this.title,
    this.subSpecialty,
    this.gender,
    this.times,
    this.building,
    this.weight,
    this.acceptPromo,
    this.firstCome,
    this.priceFrom,
    this.priceTo,
    this.from,
    this.to,
    this.isTop,
    this.page,
    this.reachMax,
    this.isFromSearchName = false,
    this.searchType = SearchType.citySpeciality,
    this.type,
    this.sort,
    this.medSortingEnum,
    this.statusLevel,
    this.category,
    this.patientId,
    this.medicalProfile,
  });

  FilterParams copyWith({
    City? government,
    City? city,
    Category? category,
    String? text,
    Category? title,
    Speciality? subSpecialty,
    Gender? gender,
    AvailableTimes? times,
    Building? building,
    String? weight,
    bool? acceptPromo,
    bool? firstCome,
    int? priceFrom,
    int? priceTo,
    int? from,
    int? to,
    bool? isTop,
    int? page,
    bool? reachMax,
    bool? isFromSearchName,
    SearchType? searchType,
    DoctorTypes? type,
    SortingOptions? sort,
    MedicalHistorySortingEnum? medSortingEnum,
    StatusLevel? statusLevel,
    int? patientId,
    bool? medicalProfile,
  }) =>
      FilterParams(
        government: government ?? this.government,
        city: city ?? this.city,
        category: category ?? this.category,
        text: text ?? this.text,
        title: title ?? this.title,
        subSpecialty: subSpecialty ?? this.subSpecialty,
        gender: gender ?? this.gender,
        times: times ?? this.times,
        building: building ?? this.building,
        weight: weight ?? this.weight,
        acceptPromo: acceptPromo ?? this.acceptPromo,
        firstCome: firstCome ?? this.firstCome,
        priceFrom: priceFrom ?? this.priceFrom,
        priceTo: priceTo ?? this.priceTo,
        from: from ?? this.from,
        to: to ?? this.to,
        isTop: isTop ?? this.isTop,
        page: page ?? this.page,
        reachMax: reachMax ?? this.reachMax,
        isFromSearchName: isFromSearchName ?? this.isFromSearchName,
        searchType: searchType ?? this.searchType,
        type: type ?? this.type,
        sort: sort ?? this.sort,
        medSortingEnum: medSortingEnum ?? this.medSortingEnum,
        statusLevel: statusLevel ?? this.statusLevel,
        patientId: patientId ?? this.patientId,
        medicalProfile: medicalProfile ?? this.medicalProfile,
      );

  @override
  List<Object?> get props => [
        government,
        city,
        category,
        text,
        title,
        subSpecialty,
        gender,
        times,
        building,
        weight,
        acceptPromo,
        firstCome,
        priceFrom,
        priceTo,
        from,
        to,
        isTop,
        page,
        reachMax,
        isFromSearchName,
        searchType,
        type,
        sort,
        medSortingEnum,
        statusLevel,
        patientId,
        medicalProfile,
      ];
}

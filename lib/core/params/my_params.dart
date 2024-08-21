import 'dart:io';

import 'package:equatable/equatable.dart';

import '/core/utils/app_enums.dart';

class MyParams extends Equatable {
  final int? id;
  final int? doctorId;
  final int? workspaceId;
  final int? doctorWorkspaceId;
  final int? specialityId;
  final String? text;
  final String? bookingDate;
  final String? date;
  final String? fromDate;
  final String? toDate;
  final ReviewSorting? sorting;
  final BookingSortingEnum? bookingSorting;
  final bool? nextDate;
  final int? page;
  final bool? reachMax;
  final BookingStatusEnum? status;

  final List<File>? oldFiles;

  final String? bankName;
  final String? accountName;
  final String? accountNum;

  const MyParams({
    this.id,
    this.doctorId,
    this.workspaceId,
    this.doctorWorkspaceId,
    this.specialityId,
    this.text,
    this.fromDate,
    this.date,
    this.bookingDate,
    this.toDate,
    this.sorting,
    this.nextDate,
    this.page,
    this.reachMax,
    this.status,
    this.bookingSorting,
    this.oldFiles,
    this.bankName,
    this.accountName,
    this.accountNum,
  });

  MyParams copyWith({
    int? id,
    int? doctorId,
    int? workspaceId,
    int? doctorWorkspaceId,
    int? specialityId,
    String? text,
    String? fromDate,
    String? date,
    String? bookingDate,
    String? toDate,
    ReviewSorting? sorting,
    BookingSortingEnum? bookingSorting,
    bool? nextDate,
    int? page,
    bool? reachMax,
    BookingStatusEnum? status,
    List<File>? oldFiles,
    String? bankName,
    String? accountName,
    String? accountNum,
  }) =>
      MyParams(
        id: id ?? this.id,
        doctorId: doctorId ?? this.doctorId,
        workspaceId: workspaceId ?? this.workspaceId,
        doctorWorkspaceId: doctorWorkspaceId ?? this.doctorWorkspaceId,
        specialityId: specialityId ?? this.specialityId,
        text: text ?? this.text,
        fromDate: fromDate ?? this.fromDate,
        date: date ?? this.date,
        bookingDate: bookingDate ?? this.bookingDate,
        toDate: toDate ?? this.toDate,
        sorting: sorting ?? this.sorting,
        bookingSorting: bookingSorting ?? this.bookingSorting,
        nextDate: nextDate ?? this.nextDate,
        page: page ?? this.page,
        reachMax: reachMax ?? this.reachMax,
        status: status ?? this.status,
        oldFiles: oldFiles ?? this.oldFiles,
        bankName: bankName ?? this.bankName,
        accountName: accountName ?? this.accountName,
        accountNum: accountNum ?? this.accountNum,
      );

  @override
  List<Object?> get props => [
        id,
        doctorId,
        workspaceId,
        doctorWorkspaceId,
        specialityId,
        text,
        fromDate,
        date,
        bookingDate,
        toDate,
        sorting,
        nextDate,
        page,
        reachMax,
        status,
        bookingSorting,
        oldFiles,
        bankName,
        accountName,
        accountNum,
      ];
}

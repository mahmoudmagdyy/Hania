import 'package:equatable/equatable.dart';

import '../../../../core/pagination/entity/pagination_response.dart';

// class GetSpecialitiesResponse extends Equatable{
//   final bool success;
//   final String message;
//   final List<Speciality> data;
//
//   const GetSpecialitiesResponse({
//     required this.success,
//     required this.message,
//     required this.data,
//   });
//
//   @override
//   List<Object?> get props => <Object?>[
//     success,
//     message,
//     data,
//   ];
// }

class GetSpecialitiesResponse<Speciality>
    extends PaginationResponse<Speciality> {
  const GetSpecialitiesResponse({
    required int status,
    required super.meta,
    required super.data,
  });
}

class Speciality extends Equatable {
  final int id;
  final int surveyId;
  final String title;
  final String icon;
  final List<Speciality> children;

  const Speciality({
    required this.id,
    required this.surveyId,
    required this.title,
    required this.icon,
    required this.children,
  });

  Speciality copyWith({
    int? id,
    int? surveyId,
    String? title,
    String? icon,
    List<Speciality>? children,
  }) {
    return Speciality(
      id: id ?? this.id,
      surveyId: surveyId ?? this.surveyId,
      title: title ?? this.title,
      icon: icon ?? this.icon,
      children: children ?? this.children,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        id,
        surveyId,
        title,
        icon,
        children,
      ];
}

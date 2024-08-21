import 'package:equatable/equatable.dart';

class GetStaticPagesResponse extends Equatable{
  final bool success;
  final String message;
  final List<StaticPage> data;

  const GetStaticPagesResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  @override
  List<Object?> get props => <Object?>[
    success,
    message,
    data,
  ];
}


class StaticPage extends Equatable {
  final int id;
  final String title;
  final String content;
  final String slug;
  final String type;

  const StaticPage({
    required this.id,
    required this.title,
    required this.content,
    required this.slug,
    required this.type,
  });

  StaticPage copyWith({
    int? id,
    String? title,
    String? content,
    String? slug,
    String? type,
  }) {
    return StaticPage(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      slug: slug ?? this.slug,
      type: type ?? this.type,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    id,
    title,
    content,
    slug,
    type,
  ];

}



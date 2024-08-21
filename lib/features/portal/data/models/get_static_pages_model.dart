import '../../domain/entities/get_static_pages_response.dart';

class GetStaticPagesModel extends GetStaticPagesResponse {
  const GetStaticPagesModel({
    required super.success,
    required super.message,
    required super.data,
  });

  factory GetStaticPagesModel.fromJson(Map<String, dynamic> json) =>
      GetStaticPagesModel(
        success: json['success'],
        message: json['message'],
        data: (json['data'] as List<dynamic>)
            .map((dynamic e) => StaticPageModel.fromJson(e))
            .toList(),
      );
}


class StaticPageModel extends StaticPage {
  const StaticPageModel({
    required super.id,
    required super.title,
    required super.content,
    required super.slug,
    required super.type,
  });

  factory StaticPageModel.fromJson(Map<String, dynamic> json) => StaticPageModel(
    id: json['id'] != null? num.tryParse(json['id'].toString())?.toInt()?? 0: 0,
    title: json['title'] ?? '',
    content: json['content'] ?? '',
    slug: json['slug'] ?? '',
    type: json['type'] ?? '',
  );

}




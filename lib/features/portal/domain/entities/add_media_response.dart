import 'package:equatable/equatable.dart';

class AddMediaResponse extends Equatable{
  final bool success;
  final String message;
  final List<AddMediaResponseData> data;

  const AddMediaResponse({
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

class AddMediaResponseData extends Equatable{
  final String path;
  final String url;

  const AddMediaResponseData({
    required this.path,
    required this.url,
  });

  AddMediaResponseData copyWith({
    String? path,
    String? url,
  }) {
    return AddMediaResponseData(
      path: path ?? this.path,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toJson() => {
    'path': path,
    'url': url,
  };

  @override
  List<Object?> get props => <Object?>[
    path,
    url,
  ];

}
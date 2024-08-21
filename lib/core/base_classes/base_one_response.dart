import 'package:equatable/equatable.dart';

class BaseOneResponse extends Equatable {
  const BaseOneResponse({
    this.data,
    this.message,
    this.success,
  });

  final dynamic data;
  final String? message;
  final bool? success;

  @override
  List<Object?> get props => [
        data,
        message,
        success,
      ];
}

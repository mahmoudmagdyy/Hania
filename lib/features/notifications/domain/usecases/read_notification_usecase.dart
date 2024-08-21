import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/read_notification_response.dart';
import '../repositories/notifications_repo.dart';


class ReadNotificationUseCase extends UseCase<ReadNotificationResponse, ReadNotificationParams> {
  final NotificationsRepository repository;

  ReadNotificationUseCase({required this.repository});

  @override
  Future<Either<Failure, ReadNotificationResponse>> call(ReadNotificationParams params) async {
    return await repository.readNotification(params: params);
  }
}


class ReadNotificationParams extends Equatable {
  final String? notificationId;

  const ReadNotificationParams({
    required this.notificationId,
  });

  Map<String, dynamic> toJson() => {
    'notification_id': notificationId,
  };

  @override
  List<Object?> get props => <Object?>[
    notificationId,
  ];

}




import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/pagination/entity/pagination_response.dart';
import '../../../../core/pagination/usecase/pagination_usecase.dart';
import '../../domain/entities/read_notification_response.dart';
import '../../domain/usecases/read_notification_usecase.dart';
import '../../domain/entities/read_all_notifications_response.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/get_notifications_response.dart';

abstract class NotificationsRepository {
  Future<Either<Failure, ReadNotificationResponse>> readNotification({
    required ReadNotificationParams params,
  });


  Future<Either<Failure, ReadAllNotificationsResponse>> readAllNotifications({
    required NoParams params,
  });


  // Future<Either<Failure, GetNotificationsResponse>> getNotifications({
  //   required NoParams params,
  // });

  Future<Either<Failure, PaginationResponse<NotificationData>>> getNotifications({
    required PaginationParams params,
  });


}

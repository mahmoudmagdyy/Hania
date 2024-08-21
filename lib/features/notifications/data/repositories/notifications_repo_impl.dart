import 'package:dartz/dartz.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../core/pagination/entity/pagination_response.dart';
import '../../../../core/pagination/usecase/pagination_usecase.dart';
import '../../../../core/utils/log_utils.dart';
import '../../../../core/error/failures.dart';
import '../../../../injection_container.dart';
import '../../../../core/utils/values/strings.dart';
import '../../data/datasources/notifications_remote_datasource.dart';
import '../../domain/repositories/notifications_repo.dart';
import '../../domain/entities/read_notification_response.dart';
import '../../domain/usecases/read_notification_usecase.dart';
import '../../domain/entities/read_all_notifications_response.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/get_notifications_response.dart';


class NotificationsRepositoryImpl implements NotificationsRepository {
  final NotificationsRemoteDataSource remote;

  NotificationsRepositoryImpl({
    required this.remote,
  });

  /// Impl
  @override
  Future<Either<Failure, ReadNotificationResponse>> readNotification({required ReadNotificationParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final ReadNotificationResponse response = await remote.readNotification(params: params);
        return Right<Failure, ReadNotificationResponse>(response);
      } on AppException catch (error) {
        Log.e('[readNotification] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, ReadNotificationResponse>(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: Strings.noInternetConnection));
    }
  }


  @override
  Future<Either<Failure, ReadAllNotificationsResponse>> readAllNotifications({required NoParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final ReadAllNotificationsResponse response = await remote.readAllNotifications();
        return Right<Failure, ReadAllNotificationsResponse>(response);
      } on AppException catch (error) {
        Log.e('[readAllNotifications] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, ReadAllNotificationsResponse>(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: Strings.noInternetConnection));
    }
  }


  // @override
  // Future<Either<Failure, GetNotificationsResponse>> getNotifications({required NoParams params}) async {
  //   if (await networkInfo.isConnected) {
  //     try {
  //       final GetNotificationsResponse response = await remote.getNotifications();
  //       return Right<Failure, GetNotificationsResponse>(response);
  //     } on AppException catch (error) {
  //       Log.e('[getNotifications] [${error.runtimeType.toString()}] ---- ${error.message}');
  //       return Left<Failure, GetNotificationsResponse>(error.toFailure());
  //     }
  //   } else {
  //     return Left(NetworkFailure(message: Strings.noInternetConnection));
  //   }
  // }

  @override
  Future<Either<Failure, PaginationResponse<NotificationData>>> getNotifications({required PaginationParams params}) async {
    try {
      final PaginationResponse<NotificationData> response = await remote.getNotifications(params: params);
      return Right<Failure, PaginationResponse<NotificationData>>(response);
    } on AppException catch (error) {
      Log.e('[getNotifications] [${error.runtimeType.toString()}] ---- ${error.message}');
      return Left<Failure, PaginationResponse<NotificationData>>(error.toFailure());
    }
  }


}


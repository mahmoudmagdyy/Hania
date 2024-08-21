import '../../../../core/error/exceptions.dart';
import '../../../../core/pagination/model/pagination_model.dart';
import '../../../../core/pagination/usecase/pagination_usecase.dart';
import '../../../../injection_container.dart';
import '../../../../core/api/dio_consumer.dart';
import '../../domain/entities/get_notifications_response.dart';
import '../models/read_notification_model.dart';
import '../../domain/usecases/read_notification_usecase.dart';
import '../models/read_all_notifications_model.dart';
import '../models/get_notifications_model.dart';

abstract class NotificationsRemoteDataSource {
  Future<ReadNotificationModel> readNotification({
    required ReadNotificationParams params,
  });

  Future<ReadAllNotificationsModel> readAllNotifications();

  // Future<GetNotificationsModel> getNotifications();

  Future<PaginationModel<NotificationData, NotificationDataModel>> getNotifications({
    required PaginationParams params,
  });

}

class NotificationsRemoteDataSourceImpl implements NotificationsRemoteDataSource {

  @override
  Future<ReadNotificationModel> readNotification({
    required ReadNotificationParams params,
  }) async {
    try {
      String readNotificationEndpoint = '/${ApiConstants.doctors}/${ApiConstants.version}/notifications/read/${params.notificationId}';
      final dynamic response = await dioConsumer.post(
        readNotificationEndpoint,
      );

      if(response['success'] == true){
        return ReadNotificationModel.fromJson(response);
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }


  @override
  Future<ReadAllNotificationsModel> readAllNotifications() async {
    try {
      const String readAllNotificationsEndpoint = '/${ApiConstants.doctors}/${ApiConstants.version}/notifications/read';
      final dynamic response = await dioConsumer.post(
        readAllNotificationsEndpoint,
      );

      if(response['success'] == true){
        return ReadAllNotificationsModel.fromJson(response);
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }


  // @override
  // Future<GetNotificationsModel> getNotifications() async {
  //   try {
  //     const String getNotificationsEndpoint = '/${ApiConstants.doctors}/${ApiConstants.version}/notifications';
  //     final dynamic response = await dioConsumer.get(
  //       getNotificationsEndpoint,
  //     );
  //
  //     if(response['success'] == true){
  //       return GetNotificationsModel.fromJson(response);
  //     }
  //     throw ServerException(message: response['message']?? '');
  //   } catch (error) {
  //     rethrow;
  //   }
  // }

  @override
  Future<PaginationModel<NotificationData, NotificationDataModel>> getNotifications({
    required PaginationParams params,
  }) async {
    try {
      const String getNotificationsEndpoint = '/${ApiConstants.doctors}/${ApiConstants.version}/notifications';
      final dynamic response = await dioConsumer.get(
        getNotificationsEndpoint,
        queryParameters: params.toJson(),
      );
      if(response['success'] == true){
        return PaginationModel.fromJson(
          json: response,
          fetchDataModel: (e) => NotificationDataModel.fromJson(e),
        );
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }

}

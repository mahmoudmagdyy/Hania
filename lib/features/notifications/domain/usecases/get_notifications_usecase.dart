import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/pagination/entity/pagination_response.dart';
import '../../../../core/pagination/usecase/pagination_usecase.dart';
import '../entities/get_notifications_response.dart';
import '../repositories/notifications_repo.dart';

// class GetNotificationsUseCase extends UseCase<GetNotificationsResponse, NoParams> {
//   final NotificationsRepository repository;
//
//   GetNotificationsUseCase({required this.repository});
//
//   @override
//   Future<Either<Failure, GetNotificationsResponse>> call(NoParams params) async {
//     return await repository.getNotifications(params: params);
//   }
// }

class GetNotificationsUseCase extends PaginationUseCase<NotificationData> {
  final NotificationsRepository repository;

  GetNotificationsUseCase({required this.repository});

  @override
  Future<Either<Failure, PaginationResponse<NotificationData>>> call(PaginationParams params) async {
    return await repository.getNotifications(params: params);
  }
}



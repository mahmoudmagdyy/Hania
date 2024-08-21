import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/read_all_notifications_response.dart';
import '../repositories/notifications_repo.dart';


class ReadAllNotificationsUseCase extends UseCase<ReadAllNotificationsResponse, NoParams> {
  final NotificationsRepository repository;

  ReadAllNotificationsUseCase({required this.repository});

  @override
  Future<Either<Failure, ReadAllNotificationsResponse>> call(NoParams params) async {
    return await repository.readAllNotifications(params: params);
  }
}




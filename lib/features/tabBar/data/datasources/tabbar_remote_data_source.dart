import '../../../../core/api/dio_consumer.dart';

abstract class TabBarRemoteDataSource {}

class TabBarRemoteDataSourceImpl implements TabBarRemoteDataSource {
  DioConsumer apiConsumer;
  TabBarRemoteDataSourceImpl({required this.apiConsumer});
}

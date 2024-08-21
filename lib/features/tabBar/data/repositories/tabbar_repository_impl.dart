import '../../../../core/services/network/netwok_info.dart';
import '/features/tabBar/data/datasources/tabbar_remote_data_source.dart';
import '/features/tabBar/domain/repositories/tabbar_repository.dart';

class TabBarRepositoryImpl implements TabBarRepository {
  final NetworkInfo networkInfo;
  final TabBarRemoteDataSource remoteDataSource;

  TabBarRepositoryImpl(
      {required this.networkInfo, required this.remoteDataSource});
}

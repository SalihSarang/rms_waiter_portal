import 'package:rms_shared_package/rms_shared_package.dart';
import '../../domain/repositories/hall_repository.dart';
import '../datasources/table_view_datasource.dart';

class HallRepositoryImpl implements IHallRepository {
  final ITableViewRemoteDataSource remoteDataSource;

  HallRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<HallModel>> getHalls() {
    return remoteDataSource.getHalls();
  }
}

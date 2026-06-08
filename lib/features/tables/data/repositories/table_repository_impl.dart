import 'package:rms_shared_package/rms_shared_package.dart';
import '../../domain/repositories/table_repository.dart';
import '../datasources/table_view_datasource.dart';

class TableRepositoryImpl implements ITableRepository {
  final ITableViewRemoteDataSource remoteDataSource;

  TableRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<TableModel>> getTables(String hallId) {
    return remoteDataSource.getTables(hallId);
  }
}

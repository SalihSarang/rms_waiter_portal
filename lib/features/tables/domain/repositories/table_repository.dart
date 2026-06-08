import 'package:rms_shared_package/rms_shared_package.dart';

abstract class ITableRepository {
  Future<List<TableModel>> getTables(String hallId);
}

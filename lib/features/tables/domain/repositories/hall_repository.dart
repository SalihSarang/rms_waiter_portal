import 'package:rms_shared_package/rms_shared_package.dart';

abstract class IHallRepository {
  Future<List<HallModel>> getHalls();
}

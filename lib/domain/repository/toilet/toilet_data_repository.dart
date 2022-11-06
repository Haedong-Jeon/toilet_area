import 'package:toilet_area/domain/model/toilet/toilet.dart';

abstract class ToiletDataRepository {
  Future getToiletListFromRemote(int page,
      {double userLat = 0, double userLng = 0});
  Future getToiletListFromLocal();
  String getKakaoMapKey();
}

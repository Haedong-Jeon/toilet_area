import 'package:toilet_area/domain/model/toilet/toilet.dart';

abstract class ToiletDataRepository {
  Future getToiletListFromRemote(int page);
  Future getToiletListFromLocal();
  Future saveToiletList(List<Toilet> toiletsFromRemote);
}
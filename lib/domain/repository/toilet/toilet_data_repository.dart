abstract class ToiletDataRepository {
  Future getToiletListFromRemote();
  Future getToiletListFromLocal();
  Future saveToiletList();
}
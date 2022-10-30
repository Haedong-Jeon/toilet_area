import 'package:sqflite/sqflite.dart';
import 'package:toilet_area/domain/model/toilet/toilet.dart';

class ToiletDbHelper {
  Database db;

  ToiletDbHelper(this.db);

  // Future getToiletListFromLocal();
  // Future saveToiletList();

  Future saveToiletList(List<Toilet> toiletsFromRemote) async {
    ///화장실 목록을 로컬 DB에 저장 하는데, 이미 있는 화장실일 경우 업데이트. 새로운 화장실일 경우 저장.
    List<Toilet> localToiletList = await getToiletListFromLocal();
    for (Toilet element in toiletsFromRemote) {
      for (Toilet toilet in localToiletList) {
        if (toilet.longitude == element.longitude && toilet.latitude == element.latitude) {
          await db.update('toilet', element.toJson(),
              where: "latitude = ? AND longitude = ?",
              whereArgs: [element.latitude, element.longitude]);
          break;
        } else {
          await db.insert('toilet', element.toJson());
          break;
        }
      }
    }
  }

  Future<List<Toilet>> getToiletListFromLocal() async {
    final List<Map<String, dynamic>> maps = await db.query("toilet");
    return maps.map((e) => Toilet.fromJson(e)).toList();
  }
}

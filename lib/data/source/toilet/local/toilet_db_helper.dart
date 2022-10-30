import 'package:sqflite/sqflite.dart';
import 'package:toilet_area/domain/model/toilet/toilet.dart';

class ToiletDbHelper {
  Database db;

  ToiletDbHelper(this.db);

  // Future getToiletListFromLocal();
  // Future saveToiletList();

  Future saveToiletList(List<Toilet> toilets) async {

  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:toilet_area/data/repository/toilet/toilet_data_repository_impl.dart';
import 'package:toilet_area/data/source/toilet/local/toilet_db_helper.dart';
import 'package:toilet_area/domain/model/toilet/toilet.dart';
import 'package:toilet_area/domain/use_case/toilet/get_toilet_list_local_use_case.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  test('로컬 DB 테스트', ()async {
    final db = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);
    Database database = await openDatabase(
      'toilet_area_db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            "CREATE TABLE toilet (id INTEGER PRIMARY KEY AUTOINCREMENT, toiletType TEXT, toiletNm INTEGER, rdnmadr TEXT, lnmadr TEXT,menToiletBowlNumber INTEGER, menUrineNumber INTEGER, menHandicapToiletBowlNumber INTEGER, menHandicapUrinalNumber INTEGER, menChildrenToiletBowlNumber INTEGER, menChildrenUrinalNumber INTEGER, ladiesToiletBowlNumber INTEGER, ladiesHandicapToiletBowlNumber INTEGER, ladiesChildrenToiletBowlNumber INTEGER, institutionNm TEXT, phoneNumber TEXT, openTime TEXT, installationYear TEXT, latitude REAL, longitude REAL, toiletPossType TEXT, toiletPosiType TEXT, careSewerageType TEXT, emgBellYn TEXT, enterentCctvYn TINYINT, dipersExchgPosi TEXT, modYear TEXT, referenceDate TEXT, instt_code INTEGER)"
        );
      },
    );
    ToiletDbHelper dpHelper = ToiletDbHelper(db);
    List<Toilet> response = await GetToiletListLocalUseCase(ToiletDataRepositoryImpl(null, dpHelper))();
    expect(response.length, 0);
  });
}
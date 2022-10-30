import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:toilet_area/data/repository/toilet/toilet_data_repository_impl.dart';
import 'package:toilet_area/data/source/toilet/local/toilet_db_helper.dart';
import 'package:toilet_area/data/source/toilet/remote/toilet_data_remote_source.dart';
import 'package:toilet_area/domain/repository/toilet/toilet_data_repository.dart';
import 'package:toilet_area/domain/use_case/toilet/get_toilet_list_local_use_case.dart';
import 'package:toilet_area/domain/use_case/toilet/get_toilet_list_remote_use_case.dart';
import 'package:toilet_area/domain/use_case/toilet/save_toilet_list_use_case.dart';
import 'package:toilet_area/presentation/toilet_list/toilet_list_view_model.dart';

Future setUp() async {
  Database database = await openDatabase(
    'toilet_area_db',
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
          "CREATE TABLE toilet (id INTEGER PRIMARY KEY AUTOINCREMENT, toiletType TEXT, toiletNm INTEGER, rdnmadr TEXT, lnmadr TEXT,menToiletBowlNumber INTEGER, menUrineNumber INTEGER, menHandicapToiletBowlNumber INTEGER, menHandicapUrinalNumber INTEGER, menChildrenToiletBowlNumber INTEGER, menChildrenUrinalNumber INTEGER, ladiesToiletBowlNumber INTEGER, ladiesHandicapToiletBowlNumber INTEGER, ladiesChildrenToiletBowlNumber INTEGER, institutionNm TEXT, phoneNumber TEXT, openTime TEXT, installationYear TEXT, latitude REAL, longitude REAL, toiletPossType TEXT, toiletPosiType TEXT, careSewerageType TEXT, emgBellYn TEXT, enterentCctvYn TINYINT, dipersExchgPosi TEXT, modYear TEXT, referenceDate TEXT, instt_code INTEGER)");
    },
  );
  ToiletDbHelper toiletDbHelper = ToiletDbHelper(database);
  ToiletDataRepository toiletDataRepository = ToiletDataRepositoryImpl(
    ToiletDataRemoteSource(),
    toiletDbHelper,
  );
  GetToiletListLocalUseCase getToiletListLocalUseCase =
      GetToiletListLocalUseCase(toiletDataRepository);
  GetToiletListFromRemoteUseCase getToiletListFromRemoteUseCase =
      GetToiletListFromRemoteUseCase(toiletDataRepository);
  SaveToiletListUseCase saveToiletListUseCase =
      SaveToiletListUseCase(toiletDataRepository);
  ToiletListViewModel toiletListViewModel = ToiletListViewModel(
    getToiletListLocalUseCase,
    getToiletListFromRemoteUseCase,
    saveToiletListUseCase,
  );
  return [
    StateNotifierProvider((ref) => toiletListViewModel),
  ];
}

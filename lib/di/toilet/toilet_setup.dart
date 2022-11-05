import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:toilet_area/data/repository/toilet/toilet_data_repository_impl.dart';
import 'package:toilet_area/data/source/toilet/local/toilet_db_helper.dart';
import 'package:toilet_area/data/source/toilet/remote/toilet_data_remote_source.dart';
import 'package:toilet_area/domain/model/toilet/toilet.dart';
import 'package:toilet_area/domain/repository/toilet/toilet_data_repository.dart';
import 'package:toilet_area/domain/use_case/toilet/get_kakao_key_use_case.dart';
import 'package:toilet_area/domain/use_case/toilet/get_toilet_list_local_use_case.dart';
import 'package:toilet_area/domain/use_case/toilet/get_toilet_list_remote_use_case.dart';
import 'package:toilet_area/domain/use_case/toilet/save_toilet_list_use_case.dart';
import 'package:toilet_area/presentation/toilet_list/view_model/toilet_list_view_model.dart';

late final StateNotifierProvider<ToiletListViewModel, List<Toilet>>
    toiletListViewModelProvider;

Future setUp() async {
  Database database = await openDatabase(
    'toilet_area_db',
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
          "CREATE TABLE toilet (id INTEGER PRIMARY KEY AUTOINCREMENT, toiletType TEXT, toiletNm TEXT, rdnmadr TEXT, lnmadr TEXT,menToiletBowlNumber TEXT, menUrineNumber TEXT, menHandicapToiletBowlNumber TEXT, menHandicapUrinalNumber TEXT, menChildrenToiletBowlNumber TEXT, menChildrenUrinalNumber TEXT, ladiesToiletBowlNumber TEXT, ladiesHandicapToiletBowlNumber TEXT, ladiesChildrenToiletBowlNumber TEXT, institutionNm TEXT, phoneNumber TEXT, openTime TEXT, installationYear TEXT, latitude TEXT, longitude TEXT, toiletPossType TEXT, toiletPosiType TEXT, careSewerageType TEXT, emgBellYn TEXT, enterentCctvYn TEXT, dipersExchgPosi TEXT, modYear TEXT, referenceDate TEXT, instt_code TEXT)");
      await db.execute(
          "CREATE TABLE user (id INTEGER PRIMARY KEY AUTOINCREMENT, latitude REAL, longitude REAL, lastAppOpenedAt TEXT)");
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
  GetKakaoKeyUseCase getKakaoKeyUseCase =
      GetKakaoKeyUseCase(toiletDataRepository);

  ToiletListViewModel _toiletListViewModel = ToiletListViewModel(
    getToiletListLocalUseCase,
    getToiletListFromRemoteUseCase,
    saveToiletListUseCase,
    getKakaoKeyUseCase,
  );
  toiletListViewModelProvider =
      StateNotifierProvider<ToiletListViewModel, List<Toilet>>(
          (ref) => _toiletListViewModel);
}

import 'package:riverpod/riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:toilet_area/data/repository/toilet/toilet_data_repository_impl.dart';
import 'package:toilet_area/data/repository/user/user_data_repository_impl.dart';
import 'package:toilet_area/data/source/toilet/local/toilet_db_helper.dart';
import 'package:toilet_area/data/source/toilet/remote/toilet_data_remote_source.dart';
import 'package:toilet_area/data/source/user/geolocator.dart';
import 'package:toilet_area/domain/model/toilet/toilet.dart';
import 'package:toilet_area/domain/model/user/user.dart';
import 'package:toilet_area/domain/repository/toilet/toilet_data_repository.dart';
import 'package:toilet_area/domain/repository/user/user_data_repository.dart';
import 'package:toilet_area/domain/use_case/toilet/get_kakao_key_use_case.dart';
import 'package:toilet_area/domain/use_case/toilet/get_toilet_list_local_use_case.dart';
import 'package:toilet_area/domain/use_case/toilet/get_toilet_list_remote_use_case.dart';
import 'package:toilet_area/domain/use_case/toilet/save_toilet_list_use_case.dart';
import 'package:toilet_area/domain/use_case/user/get_position_stream_use_case.dart';
import 'package:toilet_area/domain/use_case/user/get_user_position_use_case.dart';
import 'package:toilet_area/presentation/text/text_control.dart';
import 'package:toilet_area/presentation/text/view_model/text_view_model.dart';
import 'package:toilet_area/presentation/toilet_list/view_model/toilet_list_view_model.dart';
import 'package:toilet_area/presentation/user/view_model/user_view_model.dart';

late final StateNotifierProvider<ToiletListViewModel, List<Toilet>>
    toiletListViewModelProvider;
late final StateNotifierProvider<TextViewModel, TextControl>
    textViewModelProvider;
late final StateNotifierProvider<UserViewModel, User>
userViewModelProvider;

Future setUpProviders() async {
  Database database = await openDatabase(
    'toilet_area_db',
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
          "CREATE TABLE toilet (id INTEGER PRIMARY KEY AUTOINCREMENT, toiletType TEXT, toiletNm INTEGER, rdnmadr TEXT, lnmadr TEXT,menToiletBowlNumber INTEGER, menUrineNumber INTEGER, menHandicapToiletBowlNumber INTEGER, menHandicapUrinalNumber INTEGER, menChildrenToiletBowlNumber INTEGER, menChildrenUrinalNumber INTEGER, ladiesToiletBowlNumber INTEGER, ladiesHandicapToiletBowlNumber INTEGER, ladiesChildrenToiletBowlNumber INTEGER, institutionNm TEXT, phoneNumber TEXT, openTime TEXT, installationYear TEXT, latitude REAL, longitude REAL, toiletPossType TEXT, toiletPosiType TEXT, careSewerageType TEXT, emgBellYn TEXT, enterentCctvYn TINYINT, dipersExchgPosi TEXT, modYear TEXT, referenceDate TEXT, instt_code INTEGER)");
      await db.execute(
          "CREATE TABLE user (id INTEGER PRIMARY KEY AUTOINCREMENT, latitude REAL, longitude REAL, lastAppOpenedAt TEXT)");
    },
  );
  ToiletDbHelper toiletDbHelper = ToiletDbHelper(database);
  ToiletDataRepository toiletDataRepository = ToiletDataRepositoryImpl(
    ToiletDataRemoteSource(),
    toiletDbHelper,
  );
  GeoLocator geoLocator = GeoLocator();
  await geoLocator.getPermission();
  UserDataRepository userDataRepository = UserDataRepositoryImpl(geoLocator);
  GetToiletListLocalUseCase getToiletListLocalUseCase =
      GetToiletListLocalUseCase(toiletDataRepository);
  GetToiletListFromRemoteUseCase getToiletListFromRemoteUseCase =
      GetToiletListFromRemoteUseCase(toiletDataRepository);
  SaveToiletListUseCase saveToiletListUseCase =
      SaveToiletListUseCase(toiletDataRepository);
  GetKakaoKeyUseCase getKakaoKeyUseCase =
      GetKakaoKeyUseCase(toiletDataRepository);
  GetUserPositionUseCase getUserPositionUseCase = GetUserPositionUseCase(userDataRepository);
  GetPositionStreamUseCase getPositionStreamUseCase = GetPositionStreamUseCase(userDataRepository);
  ToiletListViewModel _toiletListViewModel = ToiletListViewModel(
    getToiletListLocalUseCase,
    getToiletListFromRemoteUseCase,
    saveToiletListUseCase,
    getKakaoKeyUseCase,
  );
  TextViewModel _textViewModel = TextViewModel(TextControl());
  UserViewModel _userViewModel = UserViewModel(getUserPositionUseCase,getPositionStreamUseCase);
  toiletListViewModelProvider =
      StateNotifierProvider<ToiletListViewModel, List<Toilet>>(
          (ref) => _toiletListViewModel);
  textViewModelProvider = StateNotifierProvider<TextViewModel, TextControl>(
      (ref) => _textViewModel);
  userViewModelProvider = StateNotifierProvider<UserViewModel, User>((ref) => _userViewModel);
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:toilet_area/data/repository/toilet/toilet_data_repository_impl.dart';
import 'package:toilet_area/data/source/toilet/local/toilet_data_local_source.dart';
import 'package:toilet_area/data/source/toilet/remote/toilet_data_remote_source.dart';
import 'package:toilet_area/domain/model/toilet/toilet.dart';
import 'package:toilet_area/domain/repository/toilet/toilet_data_repository.dart';
import 'package:toilet_area/domain/use_case/toilet/get_kakao_key_use_case.dart';
import 'package:toilet_area/domain/use_case/toilet/get_near_toilets_use_case.dart';
import 'package:toilet_area/domain/use_case/toilet/get_toilet_list_local_use_case.dart';
import 'package:toilet_area/domain/use_case/toilet/get_toilet_list_remote_use_case.dart';
import 'package:toilet_area/domain/use_case/toilet/is_no_toilet_nearby_use_case.dart';
import 'package:toilet_area/presentation/toilet_list/view_model/toilet_list_view_model.dart';

late final StateNotifierProvider<ToiletListViewModel, List<Toilet>>
    toiletListViewModelProvider;

Future setUp() async {

  ToiletDataLocalSource toiletDbHelper = ToiletDataLocalSource();
  ToiletDataRepository toiletDataRepository = ToiletDataRepositoryImpl(
    ToiletDataRemoteSource(),
    toiletDbHelper,
  );
  GetToiletListLocalUseCase getToiletListLocalUseCase =
      GetToiletListLocalUseCase(toiletDataRepository);
  GetToiletListFromRemoteUseCase getToiletListFromRemoteUseCase =
      GetToiletListFromRemoteUseCase(toiletDataRepository);
  IsNoToiletNearByUseCase isNoToiletNearByUseCase = IsNoToiletNearByUseCase();
  GetNearToiletsUseCase getNearestToiletPosUseCase =
      GetNearToiletsUseCase();
  GetKakaoKeyUseCase getKakaoKeyUseCase =
      GetKakaoKeyUseCase(toiletDataRepository);

  ToiletListViewModel _toiletListViewModel = ToiletListViewModel(
    getToiletListLocalUseCase,
    getToiletListFromRemoteUseCase,
    getNearestToiletPosUseCase,
    isNoToiletNearByUseCase,
    getKakaoKeyUseCase,
  );
  toiletListViewModelProvider =
      StateNotifierProvider<ToiletListViewModel, List<Toilet>>(
          (ref) => _toiletListViewModel);
}

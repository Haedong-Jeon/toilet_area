import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:developer' as dv;
import 'package:riverpod/riverpod.dart';

import 'package:maps_toolkit/maps_toolkit.dart';
import 'package:toilet_area/data/source/user/geolocator.dart';
import 'package:toilet_area/domain/model/toilet/toilet.dart';
import 'package:toilet_area/domain/use_case/toilet/get_kakao_key_use_case.dart';
import 'package:toilet_area/domain/use_case/toilet/get_near_toilets_use_case.dart';
import 'package:toilet_area/domain/use_case/toilet/get_toilet_list_local_use_case.dart';
import 'package:toilet_area/domain/use_case/toilet/get_toilet_list_remote_use_case.dart';
import 'package:toilet_area/domain/use_case/toilet/is_no_toilet_nearby_use_case.dart';
import 'package:toilet_area/presentation/toilet_list/ui_event/toilet_list_ui_event.dart';

class ToiletListViewModel extends StateNotifier<List<Toilet>> {
  final GetToiletListLocalUseCase getToiletListLocalUseCase;
  final GetToiletListFromRemoteUseCase getToiletListFromRemoteUseCase;
  final GetKakaoKeyUseCase getKakaoKeyUseCase;
  final IsNoToiletNearByUseCase isNoToiletNearByUseCase;
  final GetNearToiletsUseCase getNearToiletsUseCase;

  final _uiEventController = StreamController<ToiletListUiEvent>.broadcast();

  Stream<ToiletListUiEvent> get uiEventStream => _uiEventController.stream;

  ToiletListViewModel(
      this.getToiletListLocalUseCase,
      this.getToiletListFromRemoteUseCase,
      this.getNearToiletsUseCase,
      this.isNoToiletNearByUseCase,
      this.getKakaoKeyUseCase)
      : super([]);

  int toiletListPage = 0;

  Future getToiletListFromRemote(double userLat, double userLng,
      {bool isLoadMore = false}) async {
    if (!isLoadMore) {
      _uiEventController.add(const ToiletListUiEvent.onLoading());
    }
    try {
      List<Toilet> results =
          await getToiletListFromRemoteUseCase(toiletListPage);
      if (isNoToiletNearByUseCase(
        userLat: userLat,
        userLng: userLng,
        toilets: results,
      )) {
        ///화장실 없다
        state = [];
        dv.log("❌ no toilet found...! in page ${toiletListPage}");
        await loadMoreToiletFromRemote(userLat, userLng);
        return state;
      } else {
        _uiEventController.add(const ToiletListUiEvent.onSuccess());
        dv.log("✅ toilet found...!");
        state = [...state, ...results];
        return state;
      }
    } catch (e) {
      e as DioError;
      _uiEventController.add(ToiletListUiEvent.onError(e.message));
    }
    return state;
  }

  Future<List<Toilet>> loadMoreToiletFromRemote(
      double userLat, double userLng) async {
    toiletListPage += 1;
    return await getToiletListFromRemote(userLat, userLng, isLoadMore: true);
  }

  Future<List<Toilet>> getToiletListLocal() async {
    _uiEventController.add(const ToiletListUiEvent.onLoading());
    List<Toilet> toilets = await getToiletListLocalUseCase();
    Position? userPos = await GeoLocator().getUserPosition();
    state = getNearToilets(
        toilets, userPos?.latitude ?? 0, userPos?.longitude ?? 0);
    _uiEventController.add(const ToiletListUiEvent.onSuccess());
    return state;
  }

  List<Toilet> getNearToilets(
      List<Toilet> toilets, double userLat, double userLng) {
    return getNearToiletsUseCase(
        toilets: toilets, userLat: userLat, userLng: userLng);
  }

  String getKakaoKey() {
    return getKakaoKeyUseCase();
  }
}

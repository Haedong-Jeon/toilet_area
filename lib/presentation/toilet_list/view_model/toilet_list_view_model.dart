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
  double searchRange = 3.0;
  double lastSearchRange = 3.0;

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
    lastSearchRange = searchRange;
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
        state = getNearToilets(results, userLat, userLng, searchRange);
        return state;
      }
    } catch (e) {
      e as DioError;
      _uiEventController.add(ToiletListUiEvent.onError(e.message));
    }
    return state;
  }

  void clearToiletList() {
    state = [];
  }

  void setRange(double val) {
    searchRange = val;
  }

  void updateToiletListByRangeChange() {
    if(lastSearchRange == searchRange) {
      return;
    }
    clearToiletList();
    getToiletListLocal();
  }

  Future<List<Toilet>> loadMoreToiletFromRemote(
      double userLat, double userLng) async {
    toiletListPage += 1;
    return await getToiletListFromRemote(userLat, userLng, isLoadMore: true);
  }

  Future<List<Toilet>> getToiletListLocal() async {
    lastSearchRange = searchRange;
    _uiEventController.add(const ToiletListUiEvent.onLoading());
    List<Toilet> toilets = await getToiletListLocalUseCase();
    Position? userPos = await GeoLocator().getUserPosition();
    state = getNearToilets(
        toilets, userPos?.latitude ?? 0, userPos?.longitude ?? 0, searchRange);
    _uiEventController.add(const ToiletListUiEvent.onSuccess());
    return state;
  }

  List<Toilet> getNearToilets(
      List<Toilet> toilets, double userLat, double userLng, double range) {
    return getNearToiletsUseCase(
        toilets: toilets, userLat: userLat, userLng: userLng, range: range);
  }

  String getKakaoKey() {
    return getKakaoKeyUseCase();
  }
}

import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';
import 'dart:developer' as dv;
import 'package:riverpod/riverpod.dart';

import 'package:maps_toolkit/maps_toolkit.dart';
import 'package:toilet_area/domain/model/toilet/toilet.dart';
import 'package:toilet_area/domain/use_case/toilet/get_kakao_key_use_case.dart';
import 'package:toilet_area/domain/use_case/toilet/get_nearest_toilet_pos_use_case.dart';
import 'package:toilet_area/domain/use_case/toilet/get_toilet_list_local_use_case.dart';
import 'package:toilet_area/domain/use_case/toilet/get_toilet_list_remote_use_case.dart';
import 'package:toilet_area/domain/use_case/toilet/is_no_toilet_nearby_use_case.dart';
import 'package:toilet_area/domain/use_case/toilet/save_toilet_list_use_case.dart';
import 'package:toilet_area/presentation/toilet_list/ui_event/toilet_list_ui_event.dart';

class ToiletListViewModel extends StateNotifier<List<Toilet>> {
  final GetToiletListLocalUseCase getToiletListLocalUseCase;
  final GetToiletListFromRemoteUseCase getToiletListFromRemoteUseCase;
  final GetKakaoKeyUseCase getKakaoKeyUseCase;
  final IsNoToiletNearByUseCase isNoToiletNearByUseCase;
  final GetNearestToiletPosUseCase getNearestToiletPosUseCase;

  final SaveToiletListUseCase saveToiletListUseCase;
  final _uiEventController = StreamController<ToiletListUiEvent>.broadcast();

  Stream<ToiletListUiEvent> get uiEventStream => _uiEventController.stream;

  ToiletListViewModel(
      this.getToiletListLocalUseCase,
      this.getToiletListFromRemoteUseCase,
      this.getNearestToiletPosUseCase,
      this.saveToiletListUseCase,
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
        saveToiletList(state);
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
    List<Toilet> toilets = await getToiletListLocalUseCase();
    state = toilets;
    return state;
  }

  LatLng getNearestToilet(double userLat, double userLng) {
    return getNearestToiletPosUseCase(
        toilets: state, userLat: userLat, userLng: userLat);
  }

  Future saveToiletList(List<Toilet> toilets) async {
    await saveToiletListUseCase(toilets);
  }

  String getKakaoKey() {
    return getKakaoKeyUseCase();
  }
}

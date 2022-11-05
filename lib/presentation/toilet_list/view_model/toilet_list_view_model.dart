import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';
import 'dart:developer' as dv;
import 'package:riverpod/riverpod.dart';

import 'package:maps_toolkit/maps_toolkit.dart';
import 'package:toilet_area/domain/model/toilet/toilet.dart';
import 'package:toilet_area/domain/use_case/toilet/get_kakao_key_use_case.dart';
import 'package:toilet_area/domain/use_case/toilet/get_toilet_list_local_use_case.dart';
import 'package:toilet_area/domain/use_case/toilet/get_toilet_list_remote_use_case.dart';
import 'package:toilet_area/domain/use_case/toilet/save_toilet_list_use_case.dart';
import 'package:toilet_area/presentation/toilet_list/ui_event/toilet_list_ui_event.dart';

const double EARTH_RADIUS = 6371;
const KILO = 1000;

class ToiletListViewModel extends StateNotifier<List<Toilet>> {
  final GetToiletListLocalUseCase getToiletListLocalUseCase;
  final GetToiletListFromRemoteUseCase getToiletListFromRemoteUseCase;
  final GetKakaoKeyUseCase getKakaoKeyUseCase;

  final SaveToiletListUseCase saveToiletListUseCase;
  final _uiEventController = StreamController<ToiletListUiEvent>.broadcast();

  Stream<ToiletListUiEvent> get uiEventStream => _uiEventController.stream;

  ToiletListViewModel(
      this.getToiletListLocalUseCase,
      this.getToiletListFromRemoteUseCase,
      this.saveToiletListUseCase,
      this.getKakaoKeyUseCase)
      : super([]);

  int toiletListPage = 0;
  int range = 3 * KILO;

  Future getToiletListFromRemote(double userLat, double userLng,
      {bool isLoadMore = false}) async {
    if (!isLoadMore) {
      _uiEventController.add(const ToiletListUiEvent.onLoading());
    }
    try {
      List<Toilet> results =
          await getToiletListFromRemoteUseCase(toiletListPage);
      state = [...state, ...results];
      if (noToiletNearby(userLat, userLng)) {
        state = [];
        dv.log("❌ no toilet found...! in page ${toiletListPage}");
        await loadMoreToiletFromRemote(userLat, userLng);
        return state;
      } else {
        _uiEventController.add(const ToiletListUiEvent.onSuccess());
        dv.log("✅ toilet found...!");
        saveToiletList(state);
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

  bool noToiletNearby(double userLatitude, double userLongitude) {
    List<Toilet> nearToilets = [];
    for (Toilet toilet in state) {
      double? latitude = double.tryParse(toilet.latitude ?? "");
      double? longitude = double.tryParse(toilet.longitude ?? "");

      if (latitude == null || longitude == null) {
        continue;
      }
      if (_getDistance(userLatitude, userLongitude, latitude, longitude)
              .abs() <=
          range) {
        nearToilets.add(toilet);
      }
    }
    if (nearToilets.isNotEmpty) {
      _uiEventController.add(const ToiletListUiEvent.onSuccess());
    }
    return nearToilets.isEmpty;
  }

  Future<List<Toilet>> getToiletListLocal() async {
    // _uiEventController.add(const ToiletListUiEvent.onLoading());
    List<Toilet> toilets = await getToiletListLocalUseCase();
    // _uiEventController.add(const ToiletListUiEvent.onSuccess());
    state = toilets;
    return state;
  }

  Future saveToiletList(List<Toilet> toilets) async {
    await saveToiletListUseCase(toilets);
  }

  String getKakaoKey() {
    return getKakaoKeyUseCase();
  }

  double _getDistance(double lat1, double lng1, double lat2, double lng2) {
    var distanceBetweenPoints = SphericalUtil.computeDistanceBetween(
        LatLng(lat1, lng1), LatLng(lat2, lng2));
    return distanceBetweenPoints.toDouble();
  }
}

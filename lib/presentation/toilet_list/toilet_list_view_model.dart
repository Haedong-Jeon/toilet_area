import 'dart:async';

import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';
import 'package:toilet_area/domain/model/toilet/toilet.dart';
import 'package:toilet_area/domain/use_case/toilet/get_toilet_list_local_use_case.dart';
import 'package:toilet_area/domain/use_case/toilet/get_toilet_list_remote_use_case.dart';
import 'package:toilet_area/domain/use_case/toilet/save_toilet_list_use_case.dart';
import 'package:toilet_area/presentation/toilet_list/toilet_list_ui_event.dart';

class ToiletListViewModel extends StateNotifier<List<Toilet>> {
  final GetToiletListLocalUseCase getToiletListLocalUseCase;
  final GetToiletListFromRemoteUseCase getToiletListFromRemoteUseCase;

  final SaveToiletListUseCase saveToiletListUseCase;
  final _uiEventController = StreamController<ToiletListUiEvent>.broadcast();

  Stream<ToiletListUiEvent> get uiEventStream => _uiEventController.stream;

  ToiletListViewModel(this.getToiletListLocalUseCase,
      this.getToiletListFromRemoteUseCase, this.saveToiletListUseCase)
      : super([]);

  int toiletListPage = 0;

  ///원격으로 화장실 목록을 불러오는 함수. 공공 API 응답에 따라 리팩토링 필요
  Future<List<Toilet>> getToiletListFromRemote() async {
    _uiEventController.add(const ToiletListUiEvent.onLoading());
    try {
      List<Toilet> results = await getToiletListFromRemoteUseCase(toiletListPage);
      state = [...state, ...results];
      _uiEventController.add(const ToiletListUiEvent.onSuccess());
      saveToiletList(state);
    } catch (e) {
      _uiEventController.add(const ToiletListUiEvent.onError());
    }
    return state;
  }

  Future<List<Toilet>> loadMoreToiletFromRemote() async {
    toiletListPage += 1;
    return await getToiletListFromRemote();
  }
  Future<List<Toilet>> refreshToiletFromRemote() async {
    toiletListPage = 0;
    state = [];
    return await getToiletListFromRemote();
  }

  Future<List<Toilet>> getToiletListLocal() async {
    _uiEventController.add(const ToiletListUiEvent.onLoading());
    List<Toilet> toilets = await getToiletListLocalUseCase();
    _uiEventController.add(const ToiletListUiEvent.onSuccess());
    state = toilets;
    return state;
  }

  Future saveToiletList(List<Toilet> toilets) async {
    await saveToiletListUseCase(toilets);
  }
}

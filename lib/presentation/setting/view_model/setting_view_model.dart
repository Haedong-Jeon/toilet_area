import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toilet_area/domain/model/setting/setting.dart';
import 'package:toilet_area/domain/repository/setting/setting_repository.dart';

class SettingViewModel extends StateNotifier<Setting> {
  SettingViewModel(super.state, this.repository);

  final SettingRepository repository;

/*
{
  dest_marker_color: 도착지 마커 색상,
  not_dest_marker_color: 도착지가 아닌 마커 색상
  search_range: 탐색 범위 (km) 단위
}
 */

  Future loadSetting() async {
    String? destMarkerColor = await repository.loadDestMarkColor();
    String? notDestMarkerColor = await repository.loadNotDestMarkColor();
    double? searchRange = await repository.loadSearchRange();
    if (destMarkerColor == null) {
      throw "fail to load dest marker color";
    }
    if (notDestMarkerColor == null) {
      throw "fail to load not dest marker color";
    }
    if (searchRange == null) {
      throw "fail to load search range";
    }
    state = state.copyWith(
      destMarkerColor: destMarkerColor,
      notDestMarkerColor: notDestMarkerColor,
      searchRange: searchRange,
    );
  }

  Future saveSetting({String settingJson = ""}) async {
    var newSetting = jsonDecode(settingJson);
    state = state.copyWith(
      destMarkerColor: newSetting["dest_marker_color"],
      notDestMarkerColor: newSetting["not_dest_marker_color"],
      searchRange: newSetting["search_range"],
    );
    repository.saveSetting(settingJson: settingJson);
  }

  String getDestMarkerColor() {
    String? colorString = state.destMarkerColor;
    if (colorString == null) {
      throw "no color exception";
    }
    return colorString;
  }

  String getNotDestMarkerColor() {
    String? colorString = state.notDestMarkerColor;
    if (colorString == null) {
      throw "no color exception";
    }
    return colorString;
  }

  double getSearchRange() {
    double? range = state.searchRange;
    if (range == null) {
      throw "no range exception";
    }
    return range;
  }
}

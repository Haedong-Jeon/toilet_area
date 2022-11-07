import 'dart:convert';

import 'package:toilet_area/data/source/setting/setting_data_source.dart';
import 'package:toilet_area/domain/repository/setting/setting_repository.dart';

class SettingRepositoryImpl extends SettingRepository {
  final SettingDataSource settingDataSource;

  SettingRepositoryImpl(this.settingDataSource);

  @override
  Future saveSetting({String settingJson = ""}) async {
     settingDataSource.saveSetting(settingJson: settingJson);
  }

  @override
  Future loadDestMarkColor() async {
    try {
      String settingJson = await settingDataSource.loadSetting();
      var setting = jsonDecode(settingJson);
      return setting["dest_marker_color"];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future loadNotDestMarkColor() async {
    try {
      String settingJson = await settingDataSource.loadSetting();
      var setting = jsonDecode(settingJson);
      return setting["not_dest_marker_color"];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future loadSearchRange() async {
    try {
      String settingJson = await settingDataSource.loadSetting();
      var setting = jsonDecode(settingJson);
      return setting["search_range"];
    } catch (e) {
      rethrow;
    }
  }
}

/*
{
  dest_marker_color: 도착지 마커 색상,
  not_dest_marker_color: 도착지가 아닌 마커 색상
  search_range: 탐색 범위 (km) 단위
}
 */

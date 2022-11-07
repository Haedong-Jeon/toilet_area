import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toilet_area/data/repository/setting/setting_repository_impl.dart';
import 'package:toilet_area/data/source/setting/setting_data_source.dart';
import 'package:toilet_area/domain/model/setting/setting.dart';
import 'package:toilet_area/domain/repository/setting/setting_repository.dart';
import 'package:toilet_area/presentation/setting/view_model/setting_view_model.dart';

late final StateNotifierProvider<SettingViewModel, Setting>
    settingViewModelProvider;

Future setUp() async {
  SettingDataSource settingDataSource = SettingDataSource();
  bool isSettingExist = await settingDataSource.isSettingExist();
  if (!isSettingExist) {
    Map<String, dynamic> initialSetting = {
      "dest_marker_color": "blue",
      "not_dest_marker_color": "red",
      "search_range": 3.0,
    };
    settingDataSource.saveSetting(settingJson: jsonEncode(initialSetting));
  }
  SettingRepository repository = SettingRepositoryImpl(settingDataSource);
  SettingViewModel settingViewModel = SettingViewModel(Setting(), repository);
  await settingViewModel.loadSetting();
  settingViewModelProvider = StateNotifierProvider<SettingViewModel, Setting>(
      (ref) => settingViewModel);
}
/*
{
  dest_marker_color: 도착지 마커 색상,
  not_dest_marker_color: 도착지가 아닌 마커 색상
  search_range: 탐색 범위 (km) 단위
}
 */

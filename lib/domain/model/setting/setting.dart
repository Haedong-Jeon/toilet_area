/*
{
  dest_marker_color: 도착지 마커 색상,
  not_dest_marker_color: 도착지가 아닌 마커 색상
  search_range: 탐색 범위 (km) 단위
}
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting.freezed.dart';
part 'setting.g.dart';

@freezed
class Setting with _$Setting {
  factory Setting({
    String? destMarkerColor,
    String? notDestMarkerColor,
    double? searchRange,
  }) = _Setting;

  factory Setting.fromJson(Map<String, dynamic> json) => _$SettingFromJson(json);
}

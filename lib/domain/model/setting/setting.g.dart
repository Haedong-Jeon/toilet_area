// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Setting _$$_SettingFromJson(Map<String, dynamic> json) => _$_Setting(
      destMarkerColor: json['destMarkerColor'] as String?,
      notDestMarkerColor: json['notDestMarkerColor'] as String?,
      searchRange: (json['searchRange'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_SettingToJson(_$_Setting instance) =>
    <String, dynamic>{
      'destMarkerColor': instance.destMarkerColor,
      'notDestMarkerColor': instance.notDestMarkerColor,
      'searchRange': instance.searchRange,
    };

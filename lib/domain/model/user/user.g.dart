// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      destLat: (json['destLat'] as num?)?.toDouble(),
      destLng: (json['destLng'] as num?)?.toDouble(),
      desetName: json['desetName'] as String?,
      lastAppOpenedAt: json['lastAppOpenedAt'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'destLat': instance.destLat,
      'destLng': instance.destLng,
      'desetName': instance.desetName,
      'lastAppOpenedAt': instance.lastAppOpenedAt,
    };

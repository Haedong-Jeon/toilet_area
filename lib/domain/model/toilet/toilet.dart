import 'package:freezed_annotation/freezed_annotation.dart';

part 'toilet.freezed.dart';

part 'toilet.g.dart';

@freezed
class Toilet with _$Toilet {
  factory Toilet({
     String? toiletType,
     int? toiletNm,
     String? rdnmadr,
     String? lnmadr,
     int? menToiletBowlNumber,
     int? menUrineNumber,
     int? menHandicapToiletBowlNumber,
     int? menHandicapUrinalNumber,
     int? menChildrenToiletBowlNumber,
     int? menChildrenUrinalNumber,
     int? ladiesToiletBowlNumber,
     int? ladiesHandicapToiletBowlNumber,
     int? ladiesChildrenToiletBowlNumber,
     String? institutionNm,
     String? phoneNumber,
     String? openTime,
     String? installationYear,
     double? latitude,
     double? longitude,
     String? toiletPossType,
     String? toiletPosiType,
     String? careSewerageType,
     String? emgBellYn,
     bool? enterentCctvYn,
     String? dipersExchgPosi,
     String? modYear,
     String? referenceDate,
     int? instt_code,
  }) = _Toilet;

  factory Toilet.fromJson(Map<String, dynamic> json) => _$ToiletFromJson(json);
}

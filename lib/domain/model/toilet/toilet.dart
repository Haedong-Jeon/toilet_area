import 'package:freezed_annotation/freezed_annotation.dart';

part 'toilet.freezed.dart';
part 'toilet.g.dart';

@freezed
class Toilet with _$Toilet {
  factory Toilet({
    String? toiletType,
    String? toiletNm,
    String? rdnmadr,
    String? lnmadr,
    String? menToiletBowlNumber,
    String? menUrineNumber,
    String? menHandicapToiletBowlNumber,
    String? menHandicapUrinalNumber,
    String? menChildrenToiletBowlNumber,
    String? menChildrenUrinalNumber,
    String? ladiesToiletBowlNumber,
    String? ladiesHandicapToiletBowlNumber,
    String? ladiesChildrenToiletBowlNumber,
    String? institutionNm,
    String? phoneNumber,
    String? openTime,
    String? installationYear,
    String? latitude,
    String? longitude,
    String? toiletPossType,
    String? toiletPosiType,
    String? careSewerageType,
    String? emgBellYn,
    String? enterentCctvYn,
    String? dipersExchgPosi,
    String? modYear,
    String? referenceDate,
    String? instt_code,
  }) = _Toilet;

  factory Toilet.fromJson(Map<String, dynamic> json) => _$ToiletFromJson(json);
}

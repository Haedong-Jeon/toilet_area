import 'package:freezed_annotation/freezed_annotation.dart';

part 'toilet.freezed.dart';

part 'toilet.g.dart';

@freezed
class Toilet with _$Toilet {
  factory Toilet({
    required String toiletType,
    required int toiletNm,
    required String rdnmadr,
    required String lnmadr,
    required int menToiletBowlNumber,
    required int menUrineNumber,
    required int menHandicapToiletBowlNumber,
    required int menHandicapUrinalNumber,
    required int menChildrenToiletBowlNumber,
    required int menChildrenUrinalNumber,
    required int ladiesToiletBowlNumber,
    required int ladiesHandicapToiletBowlNumber,
    required int ladiesChildrenToiletBowlNumber,
    required String institutionNm,
    required String phoneNumber,
    required String openTime,
    required String installationYear,
    required double latitude,
    required double longitude,
    required String toiletPossType,
    required String toiletPosiType,
    required String careSewerageType,
    required String emgBellYn,
    required bool enterentCctvYn,
    required String dipersExchgPosi,
    required String modYear,
    required String referenceDate,
    required int instt_code,
  }) = _Toilet;

  factory Toilet.fromJson(Map<String, dynamic> json) => _$ToiletFromJson(json);
}

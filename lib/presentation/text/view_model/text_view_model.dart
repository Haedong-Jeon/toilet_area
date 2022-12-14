import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toilet_area/presentation/text/text_control.dart';

class TextViewModel extends StateNotifier<TextControl> {
  TextViewModel(super.state) : super();

  Future setTexts() async {
    dynamic textJson =
        jsonDecode(await rootBundle.loadString("assets/text/text.json"));
    state = TextControl.fromJson(textJson);
  }

  String toiletListLoadingText() {
    return state.toiletListLoadingText ?? "";
  }

  String toiletListLoadFailText() {
    return state.toiletListLoadFailText ?? "";
  }

  String findToiletInRange() {
    return state.findToiletInRange ?? "";
  }

  String toiletListLoadSuccessText() {
    return state.toiletListLoadSuccessText ?? "";
  }

  String noNameToilet() {
    return state.noNameToilet ?? "";
  }

  String menUrineNumberText() {
    return state.menUrineNumberText ?? "";
  }

  String menToiletBowlNumberText() {
    return state.menToiletBowlNumberText ?? "";
  }

  String ladiesToiletBowlNumberText() {
    return state.ladiesToiletBowlNumberText ?? "";
  }

  String menHandicapUrinalNumberText() {
    return state.menHandicapUrinalNumberText ?? "";
  }

  String menHandicapToiletBowlNumberText() {
    return state.menHandicapToiletBowlNumberText ?? "";
  }

  String ladiesHandicapToiletBowlNumberText() {
    return state.ladiesHandicapToiletBowlNumberText ?? "";
  }

  String dipersExchgPosiText() {
    return state.dipersExchgPosiText ?? "";
  }

  String enterentCctvYnText() {
    return state.enterentCctvYnText ?? "";
  }

  String setDestinationAskText() {
    return state.setDestinationAskText ?? "";
  }

  String notiWhenNear() {
    return state.notiWhenNear ?? "";
  }

  String setDestinationButtnText() {
    return state.setDestinationButtnText ?? "";
  }

  String yesText() {
    return state.yesText ?? "";
  }

  String noText() {
    return state.noText ?? "";
  }

  String destText() {
    return state.destText ?? "";
  }

  String cancelDestinationAskText() {
    return state.cancelDestinationAskText ?? "";
  }

  String arrivalText() {
    return state.arrivalText ?? "";
  }

  String cancelDestinationButtnText() {
    return state.cancelDestinationButtnText ?? "";
  }
  String searchRangeText() {
    return state.searchRangeText ?? "";
  }
  String destMarkerColorText() {
    return state.destMarkerColorText ?? "";
  }
  String notDestMarkerColorText() {
    return state.notDestMarkerColorText ?? "";
  }
}

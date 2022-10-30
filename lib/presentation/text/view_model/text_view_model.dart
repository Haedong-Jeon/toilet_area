import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:toilet_area/presentation/text/text_control.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
}

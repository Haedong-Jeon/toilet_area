import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

String mapStyle = "";
Future setUp() async {
  mapStyle = await rootBundle.loadString("assets/style/map_style.json");
}

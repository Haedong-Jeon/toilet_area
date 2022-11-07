import 'package:flutter/material.dart';
import 'package:toilet_area/presentation/style/color/color.dart';

TextStyle modalTitleStyle = const TextStyle(
  color: Colors.black,
  fontSize: 20,
  fontWeight: FontWeight.w600,
);

TextStyle modalSubtitleStyle = const TextStyle(
  color: Colors.grey,
  fontSize: 15,
  fontWeight: FontWeight.w500,
);

TextStyle menNumberStyle = const TextStyle(
  color: Colors.indigo,
  fontSize: 15,
  fontWeight: FontWeight.w600,
);
TextStyle womenNumberStyle = const TextStyle(
  color: Colors.pinkAccent,
  fontSize: 15,
  fontWeight: FontWeight.w600,
);

TextStyle toiletDataStyle = const TextStyle(
  color: Colors.black,
  fontSize: 14,
  fontWeight: FontWeight.w500,
);

ButtonStyle buttonStyle = ButtonStyle(
  fixedSize: MaterialStateProperty.all<Size>(
    const Size(
      double.maxFinite,
      50,
    ),
  ),
  backgroundColor: MaterialStateProperty.all<Color>(
    APP_PRIMARY_COLOR,
  ),
);
TextStyle buttonTextStyle = const TextStyle(
  color: Colors.white,
  fontSize: 17,
  fontWeight: FontWeight.w500,
);

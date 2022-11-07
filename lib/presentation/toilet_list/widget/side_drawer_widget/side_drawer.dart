import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toilet_area/presentation/style/color/color.dart';
import 'package:toilet_area/presentation/toilet_list/widget/side_drawer_widget/search_range_slider.dart';

class CustomSideDrawer extends ConsumerStatefulWidget {
  const CustomSideDrawer({super.key});

  @override
  _CustomSideDrawerState createState() => _CustomSideDrawerState();
}

class _CustomSideDrawerState extends ConsumerState<CustomSideDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: DRAWER_BACKGROUND_COLOR,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SearchRangeSlider(),
          ],
        ),
      ),
    );
  }
}

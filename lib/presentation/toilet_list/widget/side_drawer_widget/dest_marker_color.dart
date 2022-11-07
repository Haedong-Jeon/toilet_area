import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toilet_area/di/text/text_setup.dart';
import 'package:toilet_area/di/toilet/toilet_setup.dart';
import 'package:toilet_area/presentation/style/drawer_style/drawer_style.dart';
import 'package:toilet_area/presentation/text/view_model/text_view_model.dart';
import 'package:toilet_area/presentation/toilet_list/view_model/toilet_list_view_model.dart';

class DestMarkerColor extends ConsumerStatefulWidget {
  const DestMarkerColor({Key? key}) : super(key: key);

  @override
  _DestMarkerColorState createState() => _DestMarkerColorState();
}

class _DestMarkerColorState extends ConsumerState<DestMarkerColor> {
  @override
  Widget build(BuildContext context) {
    ToiletListViewModel toiletListViewModel =
    ref.watch(toiletListViewModelProvider.notifier);
    TextViewModel textViewModel = ref.watch(textViewModelProvider.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textViewModel.destMarkerColorText(),
          style: drawerSectionTitleStyle,
        ),
      ],
    );
  }
}

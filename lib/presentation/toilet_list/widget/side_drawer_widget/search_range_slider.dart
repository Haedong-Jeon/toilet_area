import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toilet_area/di/text/text_setup.dart';
import 'package:toilet_area/di/toilet/toilet_setup.dart';
import 'package:toilet_area/presentation/style/drawer_style/drawer_style.dart';
import 'package:toilet_area/presentation/text/view_model/text_view_model.dart';
import 'package:toilet_area/presentation/toilet_list/view_model/toilet_list_view_model.dart';

class SearchRangeSlider extends ConsumerStatefulWidget {
  const SearchRangeSlider({Key? key}) : super(key: key);

  @override
  _SearchRangeSliderState createState() => _SearchRangeSliderState();
}

class _SearchRangeSliderState extends ConsumerState<SearchRangeSlider> {
  double sliderValue = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    sliderValue =
        ref.read(toiletListViewModelProvider.notifier).searchRange / 5;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ToiletListViewModel toiletListViewModel =
        ref.watch(toiletListViewModelProvider.notifier);
    TextViewModel textViewModel = ref.watch(textViewModelProvider.notifier);
    return Column(
      children: [
        Text(
          textViewModel.searchRangeText(),
          style: drawerSectionTitleStyle,
        ),
        Container(
          child: Slider(
            value: sliderValue,
            onChanged: (val) {
              setState(() {
                sliderValue = val;
              });
              toiletListViewModel.setRange(val * 5);
            },
          ),
        ),
        Text(
          "${toiletListViewModel.searchRange.toStringAsFixed(2)}km",
          style: drawerDataStyle,
        ),
      ],
    );
  }
}

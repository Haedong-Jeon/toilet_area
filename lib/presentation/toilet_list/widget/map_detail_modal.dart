import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toilet_area/di/text/text_setup.dart';
import 'package:toilet_area/di/toilet/toilet_setup.dart';
import 'package:toilet_area/di/user/user_setup.dart';
import 'package:toilet_area/domain/model/toilet/toilet.dart';
import 'package:toilet_area/presentation/style/modal_style/modal_style.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toilet_area/presentation/text/view_model/text_view_model.dart';
import 'package:toilet_area/presentation/toilet_list/view_model/toilet_list_view_model.dart';
import 'package:toilet_area/presentation/user/view_model/user_view_model.dart';

class MapDetailModal extends ConsumerStatefulWidget {
  final Toilet toilet;

  MapDetailModal({required this.toilet});

  @override
  _MapDetailModalState createState() => _MapDetailModalState();
}

class _MapDetailModalState extends ConsumerState<MapDetailModal> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextViewModel textViewModel = ref.watch(textViewModelProvider.notifier);
    UserViewModel userViewModel = ref.watch(userViewModelProvider.notifier);
    ToiletListViewModel toiletListViewModel =
        ref.watch(toiletListViewModelProvider.notifier);
    return Container(
      padding: const EdgeInsets.only(top: 25, left: 20, right: 20, bottom: 15),
      width: size.width,
      child: Column(
        children: [
          Text(
            widget.toilet.toiletNm.toString(),
            style: modalTitleStyle,
          ),
          const SizedBox(height: 5),
          Text(
            widget.toilet.openTime.toString(),
            style: modalSubtitleStyle,
          ),
          const SizedBox(height: 25),
          renderToiletData(isMen: true),
          const SizedBox(height: 25),
          renderToiletData(isMen: false),
          const SizedBox(height: 25),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.camera_indoor,
                color: Colors.grey,
              ),
              const SizedBox(width: 10),
              Text(
                textViewModel.enterentCctvYnText(),
                style: toiletDataStyle,
              ),
              const SizedBox(width: 10),
              Text(
                widget.toilet.enterentCctvYn.toString() == "null" ? "❌" : "🟢",
              ),
            ],
          ),
          const SizedBox(height: 25),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.baby_changing_station,
                color: Colors.green,
              ),
              const SizedBox(width: 10),
              Text(
                textViewModel.dipersExchgPosiText(),
                style: toiletDataStyle,
              ),
              const SizedBox(width: 10),
              Text(
                widget.toilet.dipersExchgPosi.toString() == "null" ? "❌" : "🟢",
              ),
            ],
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              showCupertinoDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: Text(
                        textViewModel.setDestinationAskText(),
                      ),
                      content: Text(
                        textViewModel.vibrateWhenNearText(),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            textViewModel.noText(),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            double destLat =
                                double.tryParse(widget.toilet.latitude ?? "") ??
                                    0;
                            double destLng = double.tryParse(
                                    widget.toilet.longitude ?? "") ??
                                0;
                            userViewModel.setDestination(
                              destLng: destLng,
                              destLat: destLat,
                              name: widget.toilet.toiletNm.toString(),
                            );

                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            textViewModel.yesText(),
                          ),
                        ),
                      ],
                    );
                  });
            },
            style: buttonStyle,
            child: Text(
              textViewModel.setDestinationButtnText(),
              style: buttonTextStyle,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Row renderToiletData({bool isMen = true}) {
    TextViewModel textViewModel = ref.watch(textViewModelProvider.notifier);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          isMen ? Icons.man : Icons.woman,
          color: isMen ? Colors.blue : Colors.pinkAccent,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  isMen
                      ? textViewModel.menUrineNumberText()
                      : textViewModel.ladiesToiletBowlNumberText(),
                  style: toiletDataStyle,
                ),
                const SizedBox(width: 10),
                Text(
                  isMen
                      ? widget.toilet.menUrineNumber.toString()
                      : widget.toilet.ladiesToiletBowlNumber.toString(),
                  style: isMen ? menNumberStyle : womenNumberStyle,
                ),
                if (isMen) const SizedBox(width: 15),
                if (isMen)
                  Text(
                    ref
                        .watch(textViewModelProvider)
                        .menToiletBowlNumberText
                        .toString(),
                    style: toiletDataStyle,
                  ),
                if (isMen) const SizedBox(width: 10),
                if (isMen)
                  Text(
                    widget.toilet.menToiletBowlNumber.toString(),
                    style: isMen ? menNumberStyle : womenNumberStyle,
                  ),
              ],
            ),
            Row(
              children: [
                Text(
                  isMen
                      ? textViewModel.menHandicapUrinalNumberText().toString()
                      : textViewModel
                          .ladiesHandicapToiletBowlNumberText()
                          .toString(),
                  style: toiletDataStyle,
                ),
                const SizedBox(width: 10),
                Text(
                  isMen
                      ? widget.toilet.menHandicapUrinalNumber.toString()
                      : widget.toilet.ladiesHandicapToiletBowlNumber.toString(),
                  style: isMen ? menNumberStyle : womenNumberStyle,
                ),
                if (isMen) const SizedBox(width: 15),
                if (isMen)
                  Text(
                    ref
                        .watch(textViewModelProvider)
                        .menHandicapToiletBowlNumberText
                        .toString(),
                    style: toiletDataStyle,
                  ),
                if (isMen) const SizedBox(width: 10),
                if (isMen)
                  Text(
                    widget.toilet.menHandicapToiletBowlNumber.toString(),
                    style: isMen ? menNumberStyle : womenNumberStyle,
                  ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

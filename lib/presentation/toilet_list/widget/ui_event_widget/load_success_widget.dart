import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:toilet_area/di/text/text_setup.dart';
import 'package:toilet_area/presentation/style/color/color.dart';

class LoadSuccessWidget extends ConsumerStatefulWidget {
  const LoadSuccessWidget({Key? key}) : super(key: key);

  @override
  _LoadSuccessWidgetState createState() => _LoadSuccessWidgetState();
}

class _LoadSuccessWidgetState extends ConsumerState<LoadSuccessWidget> {
  late Timer timer;
  int secCounter = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      secCounter += 1;
      if (secCounter >= 1) {
        Navigator.of(context).pop();
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 200,
        width: 300,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundColor: APP_PRIMARY_COLOR,
                child: Icon(Icons.check, color: Colors.white),
              ),
              const SizedBox(height: 15),
              Text(ref.watch(textViewModelProvider).toiletListLoadSuccessText ??
                  ""),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

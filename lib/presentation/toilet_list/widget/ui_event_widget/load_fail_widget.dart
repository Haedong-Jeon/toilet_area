import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toilet_area/di/text/text_setup.dart';
import 'package:toilet_area/presentation/style/color/color.dart';

class LoadFailWidget extends ConsumerStatefulWidget {
  final String error;

  LoadFailWidget({required this.error});

  @override
  _LoadFailWidgetState createState() => _LoadFailWidgetState();
}

class _LoadFailWidgetState extends ConsumerState<LoadFailWidget> {
  late Timer timer;
  int secCounter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      secCounter += 1;
      if (secCounter >= 2) {
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
                child: Icon(Icons.close, color: Colors.white),
              ),
              const SizedBox(height: 15),
              Text(ref.watch(textViewModelProvider).toiletListLoadFailText ??
                  ""),
              const SizedBox(height: 10),
              Text(
                widget.error,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

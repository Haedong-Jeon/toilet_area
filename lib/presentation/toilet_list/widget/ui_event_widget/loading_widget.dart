import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:toilet_area/di/text/text_setup.dart';

class LoadingWidget extends ConsumerStatefulWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends ConsumerState<LoadingWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 300,
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 25),
            SizedBox(
              height: 100,
              width: 100,
              child: Lottie.asset(
                "assets/lotties/loading_lottie.json",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 15),
            Text(ref.watch(textViewModelProvider).toiletListLoadingText ?? ""),
          ],
        ),
      ),
    );
  }
}

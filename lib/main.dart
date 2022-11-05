import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toilet_area/di/set_up.dart';
import 'package:toilet_area/di/text/text_setup.dart';
import 'package:toilet_area/di/toilet/toilet_setup.dart';
import 'package:toilet_area/domain/model/toilet/toilet.dart';
import 'package:toilet_area/presentation/text/view_model/text_view_model.dart';
import 'package:toilet_area/presentation/toilet_list/view_model/toilet_list_view_model.dart';
import 'package:toilet_area/presentation/toilet_list/widget/load_fail_widget.dart';
import 'package:toilet_area/presentation/toilet_list/widget/load_success_widget.dart';
import 'package:toilet_area/presentation/toilet_list/widget/loading_widget.dart';
import 'package:toilet_area/presentation/toilet_list/widget/map_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpProviders();
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  late Future fetchToiletFromRemote;
  late Future fetchToiletFromLocal;

  @override
  void initState() {
    super.initState();
    ToiletListViewModel toiletListViewModel =
        ref.read(toiletListViewModelProvider.notifier);

    TextViewModel textViewModel = ref.read(textViewModelProvider.notifier);

    textViewModel.setTexts();

    toiletListViewModel.uiEventStream.listen((event) {
      event.when(
        onLoading: _onLoading,
        onError: _onError,
        onSuccess: _onSuccess,
      );
    });
    toiletListViewModel.getToiletListLocal();
    toiletListViewModel.getToiletListFromRemote();
  }

  void _onLoading() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const LoadingWidget();
        });
  }

  void _onError(String error) {
    if (_isThereCurrentDialogShowing(context)) {
      Navigator.of(context).pop();
    }
    //로딩 팝업 후 바로 에러 팝업을 띄우면 화면이 깜빡이는 것처럼 느껴져
    //에러 팝업은 로딩 팝업 닫고 1초 뒤에 보이도록
    Future.delayed(const Duration(seconds: 1)).then((_) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return LoadFailWidget(error: error);
          });
    });
  }

  void _onSuccess() {
    if (_isThereCurrentDialogShowing(context)) {
      Navigator.of(context).pop();
    }
    //로딩 팝업 후 바로 성공 팝업을 띄우면 화면이 깜빡이는 것처럼 느껴져
    //성공 팝업은 로딩 팝업 닫고 1초 뒤에 보이도록
    Future.delayed(const Duration(seconds: 1)).then((_) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return const LoadSuccessWidget();
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Expanded(child: MapWidget()),
        ],
      ),
    );
  }

  //현재 화면에 팝업이 있는지 점검 하는 함수
  bool _isThereCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;
}

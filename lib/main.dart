import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toilet_area/di/set_up.dart';
import 'package:toilet_area/domain/model/toilet/toilet.dart';
import 'package:toilet_area/presentation/toilet_list/toilet_list_view_model.dart';

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
    ToiletListViewModel viewModel =
        ref.read(toiletListViewModelProvider.notifier);
    viewModel.uiEventStream.listen((event) {
      event.when(onLoading: () {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return const Dialog(
                child: SizedBox(
                  height: 300,
                  width: 300,
                  child: CupertinoActivityIndicator(
                    color: Colors.indigo,
                  ),
                ),
              );
            });
      }, onError: () {
        Navigator.of(context).pop();
        log("error!");
      }, onSuccess: () {
        Navigator.of(context).pop();
        log("success!");
      });
    });
    fetchToiletFromRemote = viewModel.getToiletListLocal();
    fetchToiletFromLocal = viewModel.getToiletListFromRemote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Toilet> toiletList = ref.watch(toiletListViewModelProvider);
    ToiletListViewModel toiletListViewModel =
        ref.watch(toiletListViewModelProvider.notifier);
    return Scaffold(
      body: FutureBuilder(
          future: Future.wait([fetchToiletFromLocal, fetchToiletFromRemote]),
          builder: (context, snapshot) {
            return Container();
          }),
    );
  }
}

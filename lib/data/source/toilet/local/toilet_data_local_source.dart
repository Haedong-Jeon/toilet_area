import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:toilet_area/domain/model/toilet/toilet.dart';

class ToiletDataLocalSource {


  // Future getToiletListFromLocal();
  // Future saveToiletList();



  Future<List<Toilet>> getToiletListFromLocal() async {
    List<Toilet> list = [];
    dynamic localToiletList = jsonDecode(await rootBundle
        .loadString("assets/local_data/toilet_list_local.json"));
    for (int i = 0; i < localToiletList.length; i++) {
      Toilet toilet = Toilet.fromJson(localToiletList[i]);
      list.add(toilet);
    }
    return list;
  }
}

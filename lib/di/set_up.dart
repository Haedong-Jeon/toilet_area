import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:sqflite/sqflite.dart';

Future setUp() async {
  Database database = await openDatabase(
    'toilet_area_db',
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
          "CREATE TABLE toilet (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, color INTEGER, timestamp INTEGER)");
    },
  );
}
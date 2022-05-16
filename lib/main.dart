import 'package:flutter/material.dart';
import 'package:isilo/db/database.dart';
import 'package:isilo/models/asylum.dart';
import 'package:isilo/screens/welcome.dart';
import 'dart:developer';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database =
      await $FloorAsylumDatabase.databaseBuilder('app_database.db').build();
  final asylumnDao = database.asylumnDao;
  final asylum = Asylum(null, "Arthur", "8", "11","x", "d", "a", "b", "c", false);
  await asylumnDao.insertAsylum(asylum);
  final result = await asylumnDao.getAll();
  log('result: $result');
  print('result: ${result.length}');
  runApp(
    MyApp(
      db: await $FloorAsylumDatabase.databaseBuilder('app_database.db').build(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.db}) : super(key: key);
  final AsylumDatabase db;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iSilo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Welcome(db: db),
    );
  }
}

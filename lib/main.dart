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
  final asylum = Asylum(1, "Lucas", 2, 3, "x", "y", "z", false);
  await asylumnDao.insertAsylum(asylum);
  final result = asylumnDao.findAsylumById(1);
  log('result: $result');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iSilo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const Welcome(),
    );
  }
}

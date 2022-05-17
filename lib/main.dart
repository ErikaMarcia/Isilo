import 'package:flutter/material.dart';
import 'package:isilo/db/database.dart';
import 'package:isilo/screens/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble("latitude", -19.9381372);
  await prefs.setDouble("longitude", -43.9343437);
  print('latitude ${prefs.getDouble("latitude")}');
  print('longitude ${prefs.getDouble("longitude")}');
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

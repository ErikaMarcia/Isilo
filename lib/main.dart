import 'package:flutter/material.dart';
import 'package:isilo/db/database.dart';
import 'package:isilo/entitys/asylum.dart';
import 'package:isilo/screens/welcome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(
    db: await $FloorAsylumDatabase.databaseBuilder('aslum_database.db').build(),
  ));
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, this.db}) : super(key: key);
  final AsylumDatabase? db;

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



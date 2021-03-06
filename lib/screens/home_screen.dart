// ignore_for_file: unnecessary_new

import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:isilo/db/database.dart';
import 'package:isilo/models/asylum.dart';
import 'package:isilo/screens/information_isilo.dart';
import 'package:isilo/screens/mark_isilo.dart';
import 'package:latlong2/latlong.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.db, required this.database})
      : super(key: key);
  final AsylumDatabase db;
  final FirebaseDatabase database;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Marker> _markes = [];

  void _returnMarker() async {
    var response = await widget.db.asylumnDao.getAll();

    setState(() {
      _markes = response
          .map((e) => Marker(
              width: 80,
              height: 80,
              point: new LatLng(
                  double.parse(e.latitude.substring(1, e.latitude.length - 2)),
                  double.parse(
                      e.longitude.substring(1, e.longitude.length - 2))),
              builder: (ctx) => IconButton(
                  icon: Image.asset("assets/logo.png"),
                  iconSize: 45,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InformationIsilo(
                                  db: widget.db,
                                  id: e.id!,
                                  database: widget.database,
                                )));
                  })))
          .toList();
    });
  }

  void _asyncFirebaseAndLocal() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.wifi) {
      var response = await widget.db.asylumnDao.getAll();
      var counter = response.length;

      final ref = FirebaseDatabase.instance.ref();
      final snapshot = await ref.child('/asylums').get();
      if (snapshot.exists) {
        var dataFirebase = snapshot.value as List<Object?>;
        var conterFirebase = dataFirebase.length;
        if (counter > dataFirebase.length) {
          response.forEach((element) async {
            if (element.id! >= conterFirebase) {
              DatabaseReference ref =
                  widget.database.ref('/asylums/${element.id}');
              await ref.set({
                "id": element.id,
                "name": element.name,
                "latitude": element.latitude,
                "longitude": element.longitude,
                "image": element.image,
                "whatsApp": element.whatsApp,
                "about": element.about,
                "instructions": element.instructions,
                "openingHours": element.openingHours,
                "openOnWeekends": element.openOnWeekends
              });
            }
          });
        }
      } else {
        print('No data available.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _returnMarker();
    _asyncFirebaseAndLocal();
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Flexible(
            child: FlutterMap(
              options: MapOptions(
                  center: LatLng(-19.9381372, -43.9343437), zoom: 12),
              layers: [
                TileLayerOptions(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c']),
                new MarkerLayerOptions(markers: _markes)
              ],
            ),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      MarkIsilo(db: widget.db, database: widget.database)));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

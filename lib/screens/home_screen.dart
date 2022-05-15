// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:isilo/db/database.dart';
import 'package:isilo/screens/information_isilo.dart';
import 'package:isilo/screens/mark_isilo.dart';
import 'package:latlong2/latlong.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.db}) : super(key: key);
  final AsylumDatabase db;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
                new MarkerLayerOptions(
                  markers: [
                    new Marker(
                        width: 80,
                        height: 80,
                        point: new LatLng(-19.9381372, -43.9343437),
                        builder: (ctx) => IconButton(
                            icon: Image.asset("assets/logo.png"),
                            iconSize: 45,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          InformationIsilo(db: widget.db)));
                            }))
                  ],
                ),
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
                  builder: (context) => MarkIsilo(db: widget.db)));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

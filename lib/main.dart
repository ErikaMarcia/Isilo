import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:isilo/screens/information_isilo.dart';
import 'package:isilo/screens/mark_isilo.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var marker = <Marker>[];

    marker = [
      Marker(
          point: LatLng(-19.9381372, -43.9343437),
          builder: (ctx) => Icon(Icons.pin_drop)),
      Marker(
          point: LatLng(-18.9381372, -42.9343437),
          builder: (ctx) => Icon(Icons.pin_drop))
    ];

    return Scaffold(
      body: Center(
          child: Container(
              child: Column(
        children: [
          Flexible(
            child: FlutterMap(
              options:
                  MapOptions(center: LatLng(-19.9381372, -43.9343437), zoom: 8),
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
                        builder: (ctx) => new Container(
                            child: IconButton(
                                icon: Icon(Icons.pin_drop),
                                color: Color(0xFF6200ee),
                                iconSize: 45,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => InformationIsilo()));
                                })))
                  ],
                ),
              ],
            ),
          )
        ],
      ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MarkIsilo()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

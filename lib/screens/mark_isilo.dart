import 'package:flutter/material.dart';
import 'package:isilo/db/database.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:isilo/screens/register_isilo.dart';
import 'package:latlong2/latlong.dart';

class MarkIsilo extends StatefulWidget {
  const MarkIsilo({Key? key, required this.db}) : super(key: key);
   final AsylumDatabase db;

  @override
  _MarkIsilo createState() => _MarkIsilo();
}

class _MarkIsilo extends State<MarkIsilo> {
  @override
  Widget build(BuildContext context) {
    var marker = <Marker>[];

    marker = [
      Marker(
          point: LatLng(-19.9381372, -43.9343437),
          width: 60,
          height: 60,
          builder: (ctx) => IconButton(
                icon: Image.asset("assets/logo.png"),
                iconSize: 45,
                onPressed: () {},
              ))
    ];

    return Scaffold(
      body: Center(
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
                MarkerLayerOptions(
                  markers: marker,
                ),
              ],
            ),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>  RegisterIsilo(db: widget.db)));
          },
          tooltip: 'Increment',
          label: const Text('Cadastrar iSilo')),
    );
  }
}

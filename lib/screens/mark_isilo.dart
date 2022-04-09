import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:isilo/screens/register_isilo.dart';
import 'package:latlong2/latlong.dart';

class MarkIsilo extends StatefulWidget {
  const MarkIsilo({Key? key}) : super(key: key);

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
    builder: (ctx) => new Container(
    child: IconButton(
    icon: Icon(Icons.pin_drop),
    color: Color(0xFF6200ee),
    iconSize: 45, onPressed: () { },)))
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
                MarkerLayerOptions(
                  markers: marker,
                ),
              ],
            ),
          )
        ],
      ))),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RegisterIsilo())
          );
        },
        tooltip: 'Increment',
        label: Text('Cadastrar iSilo')
      ),
    );
  }
}

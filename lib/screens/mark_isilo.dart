import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:isilo/db/database.dart';
import 'package:isilo/screens/register_isilo.dart';
import 'package:latlong2/latlong.dart';

class MarkIsilo extends StatefulWidget {
  const MarkIsilo({
    Key? key,
    required this.db,
  }) : super(key: key);
  final AsylumDatabase db;

  @override
  _MarkIsilo createState() => _MarkIsilo();
}

class _MarkIsilo extends State<MarkIsilo> {
  List<LatLng> tappedPoints = [];

  void _handleTap(tapPosition, LatLng latlng) {
    setState(() {
      tappedPoints.isEmpty
          ? tappedPoints.add(latlng)
          : {tappedPoints.clear(), tappedPoints.add(latlng)};
    });
  }

  @override
  Widget build(BuildContext context) {
    var marker = <Marker>[];

    marker = tappedPoints.map((latlng) {
      return Marker(
        width: 60,
        height: 60,
        point: latlng,
        builder: (ctx) => GestureDetector(
          onTap: () {
            // Mostrar uma SnackBar quando clicar em um marcador
            Scaffold.of(ctx).showSnackBar(SnackBar(
                content: Text("Latitude =" +
                    latlng.latitude.toString() +
                    " :: Longitude = " +
                    latlng.longitude.toString())));
          },
          child: IconButton(
            icon: Image.asset("assets/logo.png"),
            iconSize: 45,
            onPressed: () {},
          ),
        ),
      );
    }).toList();

    return Scaffold(
        body: Center(
            child: Column(
          children: [
            Flexible(
              child: FlutterMap(
                options: MapOptions(
                    center: LatLng(-19.9381372, -43.9343437),
                    zoom: 8.0,
                    onTap: _handleTap),
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
        floatingActionButton: new Visibility(
          visible: tappedPoints.length > 0,
          child: FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegisterIsilo(
                            db: widget.db,
                            latitude: tappedPoints
                                .map((latlng) => latlng.latitude)
                                .toString(),
                            longitude: tappedPoints
                                .map((latlng) => latlng.longitude)
                                .toString())));
              },
              tooltip: 'Increment',
              label: const Text('Cadastrar iSilo')),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:isilo/models/asylum.dart';
import 'package:isilo/screens/home_screen.dart';
import 'package:isilo/widgets/card_asylum/card_asylum_widget.dart';

import 'package:latlong2/latlong.dart';
import 'package:isilo/db/database.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class InformationIsilo extends StatefulWidget {
  const InformationIsilo({Key? key, required this.db, required this.id})
      : super(key: key);
  final AsylumDatabase db;
  final int id;

  @override
  State<InformationIsilo> createState() => _InformationIsiloState();
}

class _InformationIsiloState extends State<InformationIsilo> {
  late Asylum? _asylum;

  void _returnMarker() async {
    var response = await widget.db.asylumnDao.getById(widget.id);
    setState(() {
      _asylum = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    _returnMarker();

    return MaterialApp(
      home: Scaffold(
          body: SingleChildScrollView(
              child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 0.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color(0XFF15B6D6),
                  ),
                  hoverColor: const Color(0XFFD1EDF2),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeScreen(
                                  db: widget.db,
                                )));
                  },
                )),
            Container(
              padding: const EdgeInsets.only(top: 20.0, left: 0.0),
              child: const Center(
                child:
                    Text("Isilo", style: TextStyle(color: Color(0xFF8FA7B2))),
              ),
            ),
            const Center()
          ],
        ),
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardAsylum(
                titleTxt: _asylum!.name,
                subTxt: _asylum!.about,
                image: _asylum!.image,
              ),
              Container(
                  padding:
                      const EdgeInsets.only(left: 25.0, right: 25.0, top: 30.0),
                  child: const Text("Localização",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Color(0XFF0089A5)))),
              Center(
                  heightFactor: 1.3,
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.30,
                      width: MediaQuery.of(context).size.width * 0.50,
                      child: IconButton(
                          icon: FlutterMap(
                            options: MapOptions(
                              allowPanning: false,
                              enableScrollWheel: false,
                              enableMultiFingerGestureRace: false,
                              allowPanningOnScrollingParent: false,
                              center: LatLng(
                                  double.parse(_asylum!.latitude.substring(
                                      1, _asylum!.latitude.length - 2)),
                                  double.parse(_asylum!.longitude.substring(
                                      1, _asylum!.longitude.length - 2))),
                              zoom: 15,
                            ),
                            nonRotatedLayers: [
                              TileLayerOptions(
                                urlTemplate:
                                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                                subdomains: ['a', 'b', 'c'],
                              ),
                              MarkerLayerOptions(
                                markers: [
                                  Marker(
                                      width: 80,
                                      height: 80,
                                      point: LatLng(
                                          double.parse(_asylum!.latitude.substring(
                                              1, _asylum!.latitude.length - 2)),
                                          double.parse(_asylum!.longitude
                                              .substring(
                                                  1,
                                                  _asylum!.longitude.length -
                                                      2))),
                                      builder: (ctx) => InkWell(
                                          child: Image.asset(
                                              "assets/logoIcon.png",
                                              width: 45),
                                          onTap: () => launchUrl(Uri.parse(
                                              'https://www.google.com/maps/dir/?api=1&destination=${_asylum!.latitude.substring(1, _asylum!.latitude.length - 2)},${_asylum!.longitude.substring(1, _asylum!.longitude.length - 2)}'))))
                                ],
                              ),
                            ],
                          ),
                          onPressed: () {}))),
              Container(
                  padding:
                      const EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
                  child: const Text("Instruções para visita",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Color(0XFF0089A5)))),
            ]),
        Container(
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 3),
                      blurRadius: 6)
                ],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text( _asylum!.openOnWeekends
                        ? "Atendemos final de semana"
                        : "Nao atendemos final de semana"),
                  trailing: Icon(
                    FontAwesomeIcons.circleInfo,
                    color: Color(0XFF54D3C2),
                  ),
                ),
                ListTile(
                  title: Text(_asylum!.whatsApp),
                  trailing: Icon(
                    FontAwesomeIcons.whatsapp,
                    color: Color(0XFF54D3C2),
                  ),
                ),
                ListTile(
                  title: Text(_asylum!.instructions),
                  trailing: Icon(
                     FontAwesomeIcons.triangleExclamation,
                    color:  Color(0XFF54D3C2),
                  ),
                ),
                ListTile(
                  title: Text(_asylum!.openingHours),
                  trailing: Icon(
                    FontAwesomeIcons.clock,
                    color: Color(0XFF54D3C2),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    "Agende sua visita",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(
                    FontAwesomeIcons.calendarCheck,
                    color: Color(0XFF54D3C2),
                ))
              ],
            )),
      ]))),
    );
  }
}

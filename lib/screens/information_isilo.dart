import 'package:flutter/material.dart';
import 'package:isilo/models/asylum.dart';
import 'package:isilo/screens/home_screen.dart';
import 'package:latlong2/latlong.dart';
import 'package:isilo/db/database.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:url_launcher/url_launcher.dart';

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
              SizedBox(
                child: Image.asset(
                  "assets/isiloPhoto.png",
                ),
                height: MediaQuery.of(context).size.height * 0.40,
                width: MediaQuery.of(context).size.width,
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.only(
                            bottom: 20.0, left: 25.0, right: 25.0),
                        child:  Text(_asylum!.name,
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                                color: Color(0XFF0089A5)))),
                    Container(
                      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                      child: Text(
                          _asylum!.about,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                    ),
                  ],
                ),
              ),
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
                              center: LatLng(double.parse(_asylum!.latitude.substring(1, _asylum!.latitude.length - 2)), double.parse(_asylum!.longitude.substring(1, _asylum!.longitude.length - 2))),
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
                                      point:  LatLng(double.parse(_asylum!.latitude.substring(1, _asylum!.latitude.length - 2)), double.parse(_asylum!.longitude.substring(1, _asylum!.longitude.length - 2))),
                                      builder: (ctx) => InkWell(
                                          child: Image.asset("assets/logo.png",
                                              width: 45),
                                          onTap: () => launchUrl(Uri.parse(
                                              'https://www.google.com/maps/dir/?api=1&destination=-${_asylum!.latitude.substring(1, _asylum!.latitude.length - 2)},${_asylum!.longitude.substring(1, _asylum!.longitude.length - 2)}'))))
                                ],
                              ),
                            ],
                          ),
                          onPressed: () {}))),
              const Divider(
                height: 20,
                thickness: 1,
                indent: 40,
                endIndent: 40,
                color: Color.fromARGB(255, 196, 196, 196),
              ),
              Container(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
                  child: const Text("Instruções para visita",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Color(0XFF0089A5)))),
              Container(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: Center(
                  heightFactor: 2,
                  child: Text(
                     _asylum!.instructions,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      )),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 25.0, right: 25.0, bottom: 10.0),
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFB3DAE2),
                      Color.fromARGB(255, 234, 232, 232),
                    ],
                  ),
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(5),
                    right: Radius.circular(5),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: const Icon(Icons.access_time,
                            color: Colors.blue, size: 30.0)),
                     Center(
                      child:
                          Text(_asylum!.openingHours,
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              )),
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFA1E9C5),
                      Color.fromARGB(255, 234, 232, 232),
                    ],
                  ),
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(5),
                    right: Radius.circular(5),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        child: const Icon(Icons.error_outline_sharp,
                            color: Colors.green, size: 30.0)),
                     Center(
                      child: Text(_asylum!.openOnWeekends ? 'Atendemos fim de semana' : 'Não atendemos fim de semana', 
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 17, 173, 25),
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(5),
                    right: Radius.circular(5),
                  ),
                ),
                child: InkWell(
                    child: Column(children: [
                      Center(
                        child: SizedBox(
                          child: Image.asset(
                            "assets/whatsapp.png",
                          ),
                          height: 30,
                          width: 30,
                        ),
                      ),
                      Center(
                          child: Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              child: const Text('Entrar em contato',
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  )))),
                    ]),
                    onTap: () => launchUrl(
                        Uri.parse("https://wa.me/${_asylum!.whatsApp}"))),
              )
            ]),
      ]))),
    );
  }
}

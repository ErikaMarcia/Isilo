import 'package:flutter/material.dart';
import 'package:isilo/screens/home_screen.dart';
import 'package:latlong2/latlong.dart';
import 'package:isilo/db/database.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:url_launcher/url_launcher.dart';

class InformationIsilo extends StatefulWidget {
  const InformationIsilo({Key? key, required this.db}) : super(key: key);
   final AsylumDatabase db;

  @override
  State<InformationIsilo> createState() => _InformationIsiloState();
}

class _InformationIsiloState extends State<InformationIsilo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SingleChildScrollView(
              child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 30.0),
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
                            builder: (context) =>  HomeScreen(db: widget.db,)));
                  },
                )),
            const Center(
              child: Text("Isilo", style: TextStyle(color: Color(0xFF8FA7B2))),
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
                height: MediaQuery.of(context).size.height * 0.50,
                width: MediaQuery.of(context).size.width,
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.all(5),
                        child: const Text("iSilo. Esperança",
                            style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.w700,
                                color: Color(0XFF0089A5)))),
                    const Text(
                        "Presta assistência a idosos de 60 a 90 anos que se encontre em situação de risco e/ou vulnerabilidade social.",
                        textAlign: TextAlign.justify,
                        style:
                            TextStyle(fontSize: 16, color: Color(0XFF0089A5)))
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
                              center: LatLng(-19.9381372, -43.9343437),
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
                                      point: LatLng(-19.9381372, -43.9343437),
                                      builder: (ctx) => InkWell(
                                          child: Image.asset(
                                              "assets/logo.png",
                                              width: 45),
                                          onTap: () => launchUrl(Uri.parse(
                                              "https://www.google.com/maps/dir/?api=1&destination=-19.9381372,-43.9343437"))))
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
              const Center(
                heightFactor: 2,
                child: Text('WhatsApp: (31) 99999-9999',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.black,
                    )),
              ),
              const Center(
                heightFactor: 2,
                child: Text(
                    'Instruções: O iSilo não aceita animais e crianças de até 10 anos de idade.',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.black,
                    )),
              ),
              const Center(
                heightFactor: 2,
                child: Text('Horário das visitas: Visita das 8h até as 17h.',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.black,
                    )),
              ),
            ]),
      ]))),
    );
  }
}

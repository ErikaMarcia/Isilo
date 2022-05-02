import 'package:flutter/material.dart';
import 'package:isilo/screens/home_screen.dart';

class Grandfather extends StatefulWidget {
  const Grandfather({Key? key}) : super(key: key);

  @override
  State<Grandfather> createState() => _GrandfatherState();
}

class _GrandfatherState extends State<Grandfather> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Column(
      children: [
        Column(
          children: [
            Center(child: Image.asset("../../assets/gradfather.png")),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 40.0),
                  child: Text("Escolha um \nIsilo no mapa \ne faça uma visita",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Color(0XFF0089A5))),
                )
              ],
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(child: Image.asset("../../assets/rightDetail.png")),
            IconButton(
              icon: const Icon(
                Icons.arrow_right_alt_outlined,
                color: Color(0XFF15B6D6),
              ),
              hoverColor: const Color(0XFFD1EDF2),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              },
            )
          ],
        ),
      ],
    )));
  }
}

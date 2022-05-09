import 'package:flutter/material.dart';
import 'package:isilo/screens/grandfather.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Column(
      children: [
        Column(
          children: [
            Center(child: Image.asset("../../assets/world.png")),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Leve \nfelicidade \npara o \nmundo",
                    style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w700,
                        color: Color(0XFF0089A5))),
                Text("Visite asilos e mude o \ndia de muitas pessoas",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16, color: Color(0XFF0089A5)))
              ],
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(child: Image.asset("../../assets/leftDetail.png")),
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
                        builder: (context) => const Grandfather()));
              },
            )
          ],
        ),
      ],
    )));
  }
}

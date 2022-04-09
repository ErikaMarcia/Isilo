import 'package:flutter/material.dart';

class InformationIsilo extends StatefulWidget {
  const InformationIsilo({Key? key}) : super(key: key);

  @override
  State<InformationIsilo> createState() => _InformationIsiloState();
}

class _InformationIsiloState extends State<InformationIsilo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Presta assistência a idosos de 60 a 90 anos que se encontre em situação de risco e/ou vulnerabilidade social.',
        overflow: TextOverflow.visible,
        textAlign: TextAlign.left,
        style: TextStyle(
          height: 1.6666666666666667,
          fontSize: 15.0,
          fontFamily: 'Nunito',
          fontWeight: FontWeight.w600,
          color: Color.fromARGB(255, 91, 132, 153),
          /* letterSpacing: 0.0, */
        ),
      ),
    );
  }
}

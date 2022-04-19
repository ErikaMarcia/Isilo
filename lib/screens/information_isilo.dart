import 'package:flutter/material.dart';

class InformationIsilo extends StatefulWidget {
  const InformationIsilo({Key? key}) : super(key: key);

  @override
  State<InformationIsilo> createState() => _InformationIsiloState();
}

class _InformationIsiloState extends State<InformationIsilo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('iSilo'),
        ),
        body: Column(
            children: const [
              Center(
                heightFactor: 2,
                child:
                Text(
                    'Nome: iSilo BH',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.black,
                    )
                ),
              ),
              Center(
                heightFactor: 2,
                child: Text(
                    'Sobre: iSilo para pessoas maiores de 60 anos',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.black,
                    )
                ),
              ),
              Center(
                heightFactor: 2,
                child: Text(
                    'WhatsApp: (31) 99999-9999',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.black,
                    )
                ),
              ),
              Center(
                heightFactor: 2,
                child: Text(
                    'Instruções: O iSilo não aceita animais e crianças de até 10 anos de idade.',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.black,
                    )
                ),
              ),
              Center(
                heightFactor: 2,
                child: Text(
                    'Horário das visitas: Visita das 8h até as 17h.',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.black,
                    )
                ),
              ),
            ]
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../main.dart';

class RegisterIsilo extends StatefulWidget {
  const RegisterIsilo({Key? key}) : super(key: key);

  @override
  State<RegisterIsilo> createState() => _RegisterIsiloState();
}

class _RegisterIsiloState extends State<RegisterIsilo> {
  final formKey = GlobalKey<FormState>(); //key for form
  String name = "";

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: const Color(0xFFffffff),
        body: Container(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Form(
            key: formKey, //key for form
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.04),
                const Text("Realize o cadastro do seu iSilo",
                    style: TextStyle(fontSize: 30, color: Color(0xFF363f93))),
                SizedBox(height: height * 0.05),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Nome do iSilo'),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return 'Digite o nome do iSilo corretamente!';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: height * 0.05),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Sobre'),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return 'Digite o campo corretamente!!';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: height * 0.05),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Número do WhatsApp'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                            .hasMatch(value)) {
                      return 'Digite o WhatsApp do iSilo corretamente!';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: height * 0.05),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Fotos'),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return 'Inclua as fotos do iSilo corretamente!';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: height * 0.05),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Instruções'),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return 'Digite as instruções do iSilo corretamente!';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: height * 0.05),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Atendimento'),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return 'Digite o atendimento do iSilo corretamente!';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: height * 0.05),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Atende fim de semana?'),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return 'Digite o fim de semana do iSilo corretamente!';
                    } else {
                      return null;
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            final snackBar = SnackBar(content: Text('Olhe o formulário'));
            _scaffoldKey.currentState!.showSnackBar(snackBar);
            if (formKey.currentState!.validate()) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyApp()));
            }
          },
          tooltip: 'Increment',
          label: const Text('Confirmar iSilo'),
        ));
  }
}

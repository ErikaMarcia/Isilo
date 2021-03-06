import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:isilo/db/database.dart';
import 'package:isilo/models/asylum.dart';
import 'package:isilo/screens/home_screen.dart';
import 'package:isilo/themes/app_colors.dart';
import 'package:isilo/widgets/input_text/input_text_widget.dart';
import 'package:isilo/widgets/set_buttons/set_label_buttons.dart';

class RegisterIsiloPage extends StatefulWidget {
  const RegisterIsiloPage(
      {Key? key,
      required this.db,
      required this.latitude,
      required this.longitude,
      this.asylum,
      required this.database})
      : super(key: key);
  final AsylumDatabase db;
  final String latitude;
  final String longitude;
  final Asylum? asylum;
  final FirebaseDatabase database;

  @override
  State<RegisterIsiloPage> createState() => _RegisterIsiloPageState();
}

class _RegisterIsiloPageState extends State<RegisterIsiloPage> {
  final formKey = GlobalKey<FormState>();
  late Asylum asylum;

  var _nameController;
  var _imageController;
  var _whatsAppController;
  var _aboutController;
  var _instructionsController;
  var _openingHoursController;

  @override
  void initState() {
    _nameController = TextEditingController(
        text: widget.asylum != null ? widget.asylum?.name : '');
    _imageController = TextEditingController(
        text: widget.asylum != null ? widget.asylum?.image : '');
    _whatsAppController = TextEditingController(
        text: widget.asylum != null ? widget.asylum?.whatsApp : '');
    _aboutController = TextEditingController(
        text: widget.asylum != null ? widget.asylum?.about : '');
    _instructionsController = TextEditingController(
        text: widget.asylum != null ? widget.asylum?.instructions : '');
    _openingHoursController = TextEditingController(
        text: widget.asylum != null ? widget.asylum?.openingHours : '');
    super.initState();
  }

  String? validateName(String? value) =>
      value?.isEmpty ?? true ? "O nome n??o pode ser vazio" : null;
  String? validateImage(String? value) =>
      !RegExp(r"^(?:http|https):\/\/[\w\-_]+(?:\.[\w\-_]+)+[\w\-.,@?^=%&:/~\\+#]*$")
              .hasMatch(value!)
          ? "Digite uma url de uma imagem corretamente"
          : null;
  String? validateWhastapp(String? value) =>
      !RegExp(r"^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$").hasMatch(value!)
          ? "Mascara correta (99)999999999"
          : null;
  String? validateAbout(String? value) =>
      value?.isEmpty ?? true ? "O campo sobre n??o pode ser vazio" : null;
  String? validateInstructions(String? value) =>
      value?.isEmpty ?? true ? "O campo instrucoes n??o pode ser vazio" : null;
  String? validateOpeningHours(String? value) =>
      value?.isEmpty ?? true ? "O campo atendimento n??o pode ser vazio" : null;

  Future<void> cadastrar(AsylumDatabase db, final String latitude,
      String longitude, GlobalKey<ScaffoldState> _scaffoldKey) async {
    final form = formKey.currentState;
    final snackBar = SnackBar(content: Text('Olhe o formul??rio'));
    _scaffoldKey.currentState!.showSnackBar(snackBar);

    if (form!.validate()) {
      var asylum = Asylum(
          null,
          _nameController.text,
          widget.latitude,
          widget.longitude,
          _imageController.text,
          _whatsAppController.text,
          _aboutController.text,
          _instructionsController.text,
          _openingHoursController.text,
          false);

      await widget.db.asylumnDao.insertAsylum(asylum);

      var response = await widget.db.asylumnDao.getAll();
      var counter = response.length;

      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.wifi) {
        DatabaseReference ref = widget.database.ref('/asylums/${counter}');
        await ref.set({
          "id": counter,
          "name": _nameController.text,
          "latitude": widget.latitude,
          "longitude": widget.longitude,
          "image": _imageController.text,
          "whatsApp": _whatsAppController.text,
          "about": _aboutController.text,
          "instructions": _instructionsController.text,
          "openingHours": _openingHoursController.text,
          "openOnWeekends": false
        });
      }

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen(
                    db: widget.db,
                    database: widget.database,
                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFFffffff),
      body: SingleChildScrollView(
          child: Column(
        children: [
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
                              builder: (context) => HomeScreen(
                                    db: widget.db,
                                    database: widget.database,
                                  )));
                    },
                  )),
              const Center(
                child: Text("Adicone um Isilo",
                    style: TextStyle(color: Color(0xFF8FA7B2))),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20.0, right: 30.0),
                  child: IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Color(0XFF8FA7B3),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen(
                                    db: widget.db,
                                    database: widget.database,
                                  )));
                    },
                  ))
            ],
          ),
          Container(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Form(
              key: formKey, //key for form
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.04),
                  Container(
                      margin: const EdgeInsets.only(bottom: 20.0),
                      child: const Text("Dados",
                          style: TextStyle(
                            fontSize: 30,
                            color: Color(0XFF0089A5),
                            fontWeight: FontWeight.w700,
                          ))),
                  const Divider(
                    height: 20,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                    color: Color.fromARGB(255, 196, 196, 196),
                  ),
                  SizedBox(height: height * 0.05),
                  InputTextWidget(
                    controller: _nameController,
                    label: "Nome do iSilo",
                    icon: Icons.house_outlined,
                    validator: validateName,
                  ),
                  InputTextWidget(
                    controller: _aboutController,
                    label: "Sobre",
                    icon: Icons.description_outlined,
                    validator: validateAbout,
                  ),
                  InputTextWidget(
                    controller: _whatsAppController,
                    label: "N??mero do WhatsApp",
                    icon: Icons.whatsapp_outlined,
                    validator: validateWhastapp,
                  ),
                  InputTextWidget(
                    controller: _imageController,
                    label: "Fotos",
                    icon: Icons.add_photo_alternate,
                    validator: validateImage,
                  ),
                  InputTextWidget(
                    controller: _instructionsController,
                    label: "Instru????es",
                    icon: Icons.rule,
                    validator: validateInstructions,
                  ),
                  InputTextWidget(
                    controller: _openingHoursController,
                    label: "Atendimento",
                    icon: Icons.schedule_outlined,
                    validator: validateOpeningHours,
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            height: 1,
            thickness: 1,
            color: AppColors.stroke,
          ),
          SetLabelButtons(
            enableSecondaryColor: true,
            labelPrimary: "Cancelar",
            onTapPrimary: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeScreen(
                          db: widget.db, database: widget.database)));
            },
            labelSecondary: "Cadastrar",
            onTapSecondary: () async {
              await cadastrar(
                  widget.db, widget.latitude, widget.longitude, _scaffoldKey);
            },
          ),
        ],
      ),
    );
  }
}

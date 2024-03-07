// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, import_of_legacy_library_into_null_safe, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:naturale_app/firebase/auth.dart';
import 'package:naturale_app/firebase/firestore.dart';
import 'package:naturale_app/utils/constraits.dart';

class Introduction extends StatelessWidget {
  const Introduction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Naturale Nutrición",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          kDefaultBackground,
          IntroductionBody(),
        ],
      ),
    );
  }
}

class IntroductionBody extends StatelessWidget {
  const IntroductionBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IntroHeader(),
              SizedBox(height: 30),
              IntroForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class IntroForm extends StatelessWidget {
  IntroForm({
    Key? key,
  }) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _sexController = TextEditingController();
  final TextEditingController _municipioController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var sumbitContainer = GestureDetector(
      onTap: () async {
        if (_nameController.text.isEmpty ||
            _weightController.text.isEmpty ||
            _heightController.text.isEmpty ||
            _ageController.text.isEmpty ||
            _sexController.text.isEmpty ||
            _municipioController.text.isEmpty ||
            _phoneNumberController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Por favor, llena todos los campos"),
            ),
          );
          return;
        }

        User? usuario = AuthenticationService().getCurrentUser();
        if (usuario == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("No se pudo obtener el usuario"),
            ),
          );
          return;
        }

        // Show loading
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Cargando..."),
          ),
        );

        await usuario.updateDisplayName(_nameController.text);
        await FirestoreService().updateUser(user: usuario, data: {
          "name": _nameController.text,
          "weight": int.parse(_weightController.text),
          "height": int.parse(_heightController.text),
          "genero": _sexController.text,
          "edad": int.parse(_ageController.text),
          "municipio": _municipioController.text,
          "phoneNumber": int.parse(_phoneNumberController.text),
          "IMC": int.parse(_weightController.text) /
              ((int.parse(_heightController.text) / 100) *
                  ((int.parse(_heightController.text) / 100))),
        });

        // Hide the loading indicator
        ScaffoldMessenger.of(context).hideCurrentSnackBar();

        Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
      },
      child: Container(
        padding: EdgeInsets.all(kDefaultPadding),
        width: double.infinity,
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          "Continuar",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    return Column(
      children: [
        // Nombre
        TextField(
          controller: _nameController,
          decoration: InputDecoration(
            labelText: "Nombre",
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
          ),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        // Peso
        TextField(
          controller: _weightController,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            labelText: "Peso (kg)",
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
          ),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        // Altura
        TextField(
          controller: _heightController,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            labelText: "Altura (cm)",
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
          ),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        // Edad
        TextField(
          controller: _ageController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: "Edad",
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
          ),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        // Sexo (Hombre o Mujer)
        TextField(
          controller: _sexController,
          decoration: InputDecoration(
            labelText: "Sexo (Masculino, Femenino u Otro)",
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
          ),
          style: TextStyle(
            color: Colors.white,
          ),
        ),

        // Municipio
        TextField(
          controller: _municipioController,
          decoration: InputDecoration(
            labelText: "Municipio",
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
          ),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        // Número de teléfono
        TextField(
          controller: _phoneNumberController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: "Número de teléfono",
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
          ),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        SizedBox(height: 20),
        // Aviso
        Text(
          "No podras cambiar estos datos despues",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        // Aviso
        Text(
          "Todos tus datos seran guardados de forma segura y privada en nuestros servidores y no seran compartidos con nadie mas que con el equipo de Naturale Nutrición para poder brindarte un mejor servicio y poder ayudarte a cumplir tus metas de salud y bienestar de la mejor manera posible ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
          textAlign: TextAlign.center,
        ),

        // Botón de continuar
        SizedBox(height: 20),
        sumbitContainer,
      ],
    );
  }
}

class IntroHeader extends StatelessWidget {
  const IntroHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Bienvenido a Naturale Nutrición",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Naturale Nutrición es una aplicación que te ayudará a llevar un control de tu alimentación y de tu peso con la ayuda de Ale ❤️.",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        Text(
          "Para comenzar, necesitamos que nos des algunos datos: ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

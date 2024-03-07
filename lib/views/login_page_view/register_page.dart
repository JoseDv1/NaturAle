// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, unused_import, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:naturale_app/firebase/auth.dart';
import 'package:naturale_app/utils/constraits.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  // Get the text from the email and password text fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    // This function is called when the user taps the sign up button.
    void handleTap() async {
      // Check that the user has filled all the fields
      if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Por favor, llena todos los campos'),
          ),
        );
        return;
      }

      // Check that the user has entered the same password twice
      if (_passwordController.text != _confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Las contraseñas no coinciden'),
          ),
        );
        return;
      }

      //Show a loading indicator
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(
                width: 20,
              ),
              Text('Creando cuenta...'),
            ],
          ),
        ),
      );

      // Create an account in Firebase
      User? user = await AuthenticationService().signUp(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Hide the loading indicator
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      // If the user is null, it means that there was an error
      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al crear la cuenta'),
          ),
        );
        return;
      }

      // If the user is not null, it means that the account was successfully
      // Navigate to the introduction screen
      Navigator.pushNamedAndRemoveUntil(
          context, '/introduction', (route) => false);
    }

    return Scaffold(
      body: Stack(
        children: [
          // Background
          kDefaultBackground,
          // Body
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Bienvenido
                    Text(
                      '¡Bienvenido, Por favor registrate!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: kWhiteColor,
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    // Correo electrónico
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      decoration: BoxDecoration(
                        color: Colors.amber[50],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'Correo electrónico',
                          border: InputBorder.none,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    // Contraseña
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      decoration: BoxDecoration(
                        color: Colors.amber[50],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Contraseña',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Confirmar Contraseña
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      decoration: BoxDecoration(
                        color: Colors.amber[50],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        controller: _confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Confirmar Contraseña',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    // Boton de registrarse
                    InkWell(
                      onTap: handleTap,
                      child: Container(
                        width: double.infinity,
                        margin:
                            EdgeInsets.symmetric(horizontal: kDefaultPadding),
                        decoration: BoxDecoration(
                          color: kSecondaryColor[200]?.withOpacity(1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.all(kDefaultPadding),
                        child: Center(
                          child: Text(
                            "Registrarse",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: kWhiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Already have an account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Ya tienes una cuenta?",
                          style: TextStyle(
                            color: kWhiteColor,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.popAndPushNamed(context, '/login');
                          },
                          child: Text(
                            "Inicia sesión",
                            style: TextStyle(
                              color: kWhiteColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

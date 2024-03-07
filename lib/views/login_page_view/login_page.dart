// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, unused_import, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:naturale_app/firebase/auth.dart';
import 'package:naturale_app/utils/constraits.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  // Get the text from the email and password text fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
                      '¡Bienvenido de nuevo!',
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
                      height: 20,
                    ),

                    // Boton de iniciar sesión
                    InkWell(
                      onTap: () async {
                        // Validate the user's email and password
                        if (_emailController.text.isEmpty ||
                            _passwordController.text.isEmpty) {
                          // Show a snackbar if the user enters an invalid email
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text('Por favor, llena todos los campos'),
                            ),
                          );
                          return;
                        }

                        //Show a loading indicator while the user is being authenticated
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Row(
                              children: [
                                CircularProgressIndicator(),
                                SizedBox(
                                  width: 20,
                                ),
                                Text('Iniciando sesión...'),
                              ],
                            ),
                          ),
                        );

                        // Sign in with the user's email and password
                        User? user = await AuthenticationService().signIn(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );

                        // Hide the loading indicator
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();

                        // Check for errors
                        if (user == null) {
                          // Show a snackbar if there is an error
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Error al iniciar sesión'),
                            ),
                          );
                          return;
                        }

                        // Navigate to the home page
                        Navigator.pushReplacementNamed(context, '/');
                      },
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
                            "Iniciar sesión",
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
                          "¿No tienes una cuenta?",
                          style: TextStyle(
                            color: kWhiteColor,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.popAndPushNamed(context, '/register');
                          },
                          child: Text(
                            "Regístrate",
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

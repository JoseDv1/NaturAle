// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:naturale_app/firebase/auth.dart';
import 'package:naturale_app/firebase/firestore.dart';
import 'package:naturale_app/utils/constraits.dart';

class AddFood extends StatefulWidget {
  const AddFood({Key? key}) : super(key: key);

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Agregar comida'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          kDefaultBackground,
          AddFoodBody(),
        ],
      ),
    );
  }
}

class AddFoodBody extends StatelessWidget {
  AddFoodBody({
    Key? key,
  }) : super(key: key);

  // Controllers for the text fields
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _ingredientsController = TextEditingController();
  final TextEditingController _preparationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: SingleChildScrollView(
          child: Column(children: [
            // Title
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: "Título (¿Qué comiste?)",
                labelStyle: TextStyle(
                  fontSize: 20,
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
                hintText: "Ej: Bandeja Paisa",
                hintStyle: TextStyle(
                  color: Colors.white60,
                ),
              ),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            // Place
            TextField(
              controller: _placeController,
              decoration: InputDecoration(
                labelText: "Lugar (¿Dónde lo comiste?)",
                labelStyle: TextStyle(
                  fontSize: 20,
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
                hintText: "Ej: Restaurante La Cabaña",
                hintStyle: TextStyle(
                  color: Colors.white60,
                ),
              ),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            // Ingredients
            TextField(
              controller: _ingredientsController,
              decoration: InputDecoration(
                labelText: "Ingredientes (¿Qué llevaba?)",
                labelStyle: TextStyle(
                  fontSize: 20,
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
                hintText:
                    "Ej: Arroz, frijoles, carne, huevo, arepa, plátano, aguacate, chicharrón, queso, salsa, ensalada",
                hintStyle: TextStyle(
                  color: Colors.white60,
                ),
              ),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            // Preparation
            TextField(
              controller: _preparationController,
              decoration: InputDecoration(
                labelText: "Preparación (¿Cómo lo prepararon?)",
                labelStyle: TextStyle(
                  fontSize: 20,
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
                hintText:
                    "Ej: la carne se preparó a la parrilla, el arroz se cocinó en una olla, etc.",
                hintStyle: TextStyle(
                  color: Colors.white60,
                ),
              ),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(height: kDefaultPadding),
            // Aviso
            Text(
              "Nota: Revisa que los datos ingresados sean correctos antes de guardarlos. Una vez guardados, no podrás modificarlos.",
              style: TextStyle(
                color: Colors.white,
              ),
            ),

            SizedBox(height: kDefaultPadding),
            // Button
            InkWell(
              onTap: () {
                // Validate the fields
                if (_titleController.text.isEmpty ||
                    _placeController.text.isEmpty ||
                    _ingredientsController.text.isEmpty ||
                    _preparationController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Por favor, llene todos los campos"),
                    ),
                  );
                  return;
                }

                // Add the food to the database and show a message if there is an error
                FirestoreService()
                    .addFood(
                  uid: AuthenticationService().getCurrentUser()!.uid,
                  title: _titleController.text,
                  place: _placeController.text,
                  ingredients: _ingredientsController.text,
                  preparation: _preparationController.text,
                )
                    .catchError((error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Error al agregar la comida"),
                    ),
                  );

                  return;
                });

                // Go back to the food diary page and refresh it to show the new food added
                Navigator.pushNamedAndRemoveUntil(context, '/food_diary',
                    (route) => '/' == route.settings.name);
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Agregar",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:naturale_app/firebase/auth.dart';
import 'package:naturale_app/firebase/firestore.dart';
import 'package:naturale_app/utils/constraits.dart';

class Food extends StatelessWidget {
  const Food({
    Key? key,
    required this.title,
    required this.date,
    required this.hour,
    required this.place,
    required this.ingredients,
    required this.preparation,
    required this.foodid,
  }) : super(key: key);

  final String title;
  final String date;
  final String hour;
  final String place;
  final String ingredients;
  final String preparation;
  final String foodid;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: kDefaultPadding),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: kDefaultPadding / 2),
                Text(
                  "Comido el dia $date a las $hour",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                const SizedBox(height: kDefaultPadding / 2),
                SizedBox(
                  width: 200,
                  child: Text(
                    "Ingredientes: $ingredients",
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                const SizedBox(height: kDefaultPadding / 2),
                Text(
                  "Preparación: $preparation",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                const SizedBox(height: kDefaultPadding / 2),
                Text(
                  "Lugar: $place",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                // Sure to delete?
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("¿Estás seguro?"),
                      content: const Text(
                          "¿Estás seguro que quieres eliminar esta comida? No podras recuperarla después y no se podrá ver en tu historial de comidas."),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Cancelar"),
                        ),
                        TextButton(
                          onPressed: () {
                            // Delete food
                            FirestoreService().deleteFood(
                              uid:
                                  AuthenticationService().getCurrentUser()!.uid,
                              doc: foodid,
                            );
                            // Refresh page
                            Navigator.pushNamedAndRemoveUntil(
                                context,
                                '/food_diary',
                                (route) => '/' == route.settings.name);
                          },
                          child: const Text("Eliminar"),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

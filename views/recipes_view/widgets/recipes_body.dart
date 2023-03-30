import 'package:flutter/material.dart';
import 'package:naturale_app/views/recipes_view/widgets/recipe.dart';

class RecipesBody extends StatelessWidget {
  const RecipesBody({
    Key? key,
    required this.query,
  }) : super(key: key);

  final Future<List<dynamic>> query;

  @override
  build(BuildContext context) {
    // Use FutureBuilder to get the data from Firestore
    return FutureBuilder(
      future: query,
      builder: (context, snapshot) {
        // Check if the data was retrieved successfully
        if (snapshot.hasData) {
          return SafeArea(
            child: PageView(
              physics: const BouncingScrollPhysics(),
              children: [
                // Create a Recipe widget for each recipe in the database
                for (var recipe in snapshot.data!)
                  Recipe(
                    image: recipe['image'],
                    title: recipe['title'],
                    description: recipe['description'],
                    ingredients: recipe['ingredients'],
                    time: recipe['time'],
                    preparation: recipe['preparation'],
                  ),
              ],
            ),
          );
        } else {
          // Show a loading indicator while the data is retrieved
          return const Center(
              child: CircularProgressIndicator(color: Colors.white));
        }
      },
    );
  }
}

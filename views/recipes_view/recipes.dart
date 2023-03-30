// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:naturale_app/firebase/firestore.dart';
import 'package:naturale_app/utils/constraits.dart';

import 'package:naturale_app/views/recipes_view/widgets/recipes_body.dart';

class Recetas extends StatefulWidget {
  const Recetas({Key? key}) : super(key: key);

  @override
  State<Recetas> createState() => _RecetasState();
}

class _RecetasState extends State<Recetas> {
  late List<String> normalizedSearch;
  Future<List> _query = FirestoreService().getCollectionData('recipes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: TextField(
          onSubmitted: (value) {
            if (value.isEmpty) {
              setState(() {
                _query = FirestoreService().getCollectionData('recipes');
              });
              return;
            }
            setState(() {
              normalizedSearch =
                  value.toLowerCase().split(',').map((e) => e.trim()).toList();
              _query = FirestoreService().getRecipesByTags(normalizedSearch);
            });
          },
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.white),
            border: InputBorder.none,
          ),
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          // Background Image
          kDefaultBackground,
          // Recipes Body
          RecipesBody(query: _query),
        ],
      ),
    );
  }
}

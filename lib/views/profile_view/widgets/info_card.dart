// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:naturale_app/utils/constraits.dart';
import 'dart:math';

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.age,
    required this.genre,
    required this.height,
    required this.municipality,
    required this.weight,
  }) : super(key: key);

  final int height;
  final int weight;
  final int age;
  final String genre;
  final String municipality;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            // Altura
            ListTile(
              leading: const Icon(Icons.height),
              title: const Text('Altura'),
              trailing: Text('$height cm'),
            ),
            // Peso
            ListTile(
              leading: Icon(Icons.line_weight),
              title: Text('Peso'),
              trailing: Text('$weight kg'),
            ),
            // Edad
            ListTile(
              leading: Icon(Icons.cake),
              title: Text('Edad'),
              trailing: Text('$age años'),
            ),
            // Sexo
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Sexo'),
              trailing: Text(genre),
            ),
            // IMC
            ListTile(
              leading: Icon(Icons.fitness_center),
              title: Text('IMC'),
              trailing:
                  Text((weight / pow(height / 100, 2)).toStringAsFixed(2)),
            ),
            // Municipio
            ListTile(
              leading: Icon(Icons.location_city),
              title: Text('Municipio'),
              trailing: Text(municipality),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:naturale_app/utils/constraits.dart';

class TipsBody extends StatelessWidget {
  const TipsBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: kDefaultPadding),
          child: Column(
            children: const [
              Tip(
                  description:
                      "Comer frutas y verduras de temporada tiene muchas ventajas. Son más baratas, más sabrosas y más nutritivas. Además, son más respetuosas con el medio ambiente y con los animales."),
              Tip(
                  description:
                      "Seguir una dieta saludable es muy importante para tu salud y tu bienestar. Es importante que comas frutas y verduras todos los días."),
              Tip(
                  description:
                      "Come siempre a las mismas horas. Sabemos que hoy en día esto puede resultar complicado debido a nuestro ritmo de vida, pero es conveniente que te esfuerces en conseguirlo"),
              Tip(
                  description:
                      "Haz de la variedad de frutas, vegetales y granos integrales, la base de tu alimentación"),
              Tip(description: "Desayuna todos los días"),
              Tip(description: "Reduce el consumo de sal y de azúcar"),
              Tip(
                  description:
                      "Sustituye las grasas trans y saturadas por las poliinsaturadas: minimiza el consumo de ultraprocesados"),
            ],
          ),
        ),
      ),
    );
  }
}

class Tip extends StatelessWidget {
  const Tip({
    Key? key,
    required this.description,
    this.bgColor = kWhiteColor,
    this.textColor = kBlackColor,
  }) : super(key: key);

  final Color bgColor;
  final Color textColor;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          left: kDefaultPadding, right: kDefaultPadding, top: kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Icon(
              Icons.lightbulb_outline,
              size: 40,
              color: textColor,
            ),
          ),
          Expanded(
            flex: 7,
            child: Text(
              description,
              style: TextStyle(
                color: textColor,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

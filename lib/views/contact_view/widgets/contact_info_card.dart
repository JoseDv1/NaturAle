import 'package:flutter/material.dart';
import 'package:naturale_app/utils/constraits.dart';

class ContactInfoCard extends StatelessWidget {
  const ContactInfoCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(kDefaultPadding),
          padding: const EdgeInsets.all(kDefaultPadding),
          height: 500,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(height: 50),
              Text("Alejandra Villegas",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(height: kDefaultPadding),
              Text(
                "Hola soy Ale, me apasiona la nutrición y enseñarle a las personas sobre cómo llevar un estilo de vida saludable, equilibrado y consciente. Por medio de alimentos naturales, con el menor grado de procesamiento posible, alimentos llenos de nutrientes que le darán vida y color a cada plato servido en nuestra mesa 🍃",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: kDefaultPadding),
              Text(
                  "Puedes ponerte en contacto conmigo a traves de los suiguientes medios",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  )),
            ],
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          right: 10,
          child: Container(
            height: 90,
            width: 90,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage("lib/assets/images/Alejandra.jpg"),
              ),
            ),
          ),
        )
      ],
    );
  }
}

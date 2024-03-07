// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:naturale_app/utils/constraits.dart';
// Widgets
import 'package:naturale_app/views/home/widgets/card.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(kDefaultPadding),
          child: Column(
            children: [
              MenuCard(
                title: "Recetas",
                primaryColor: kWhiteColor,
                secondaryColor: kBlackColor,
                icon: Icons.restaurant,
                onPressed: () {
                  Navigator.pushNamed(context, '/recipes');
                },
              ),
              SizedBox(height: kDefaultPadding + 10),
              MenuCard(
                title: "Blog",
                primaryColor: kWhiteColor,
                secondaryColor: kBlackColor,
                icon: Icons.book,
                onPressed: () {
                  Navigator.pushNamed(context, '/blog');
                },
              ),
              SizedBox(height: kDefaultPadding + 10),
              MenuCard(
                title: "Diario \n de Alimentos",
                primaryColor: kWhiteColor,
                secondaryColor: kBlackColor,
                icon: Icons.restaurant_menu,
                onPressed: () {
                  Navigator.pushNamed(context, '/food_diary');
                },
              ),
              SizedBox(height: kDefaultPadding + 10),
              MenuCard(
                title: "Tips de salud",
                primaryColor: kWhiteColor,
                secondaryColor: kBlackColor,
                icon: Icons.lightbulb_outline,
                onPressed: () {
                  Navigator.pushNamed(context, '/tips');
                },
              ),
              SizedBox(height: kDefaultPadding + 10),
              MenuCard(
                title: "Contacto",
                primaryColor: kWhiteColor,
                secondaryColor: kBlackColor,
                icon: Icons.contact_mail,
                onPressed: () {
                  Navigator.pushNamed(context, '/contact');
                },
              ),
              SizedBox(height: kDefaultPadding + 10),
            ],
          ),
        ),
      ),
    );
  }
}

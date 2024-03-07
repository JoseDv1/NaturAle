// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:naturale_app/utils/constraits.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    Key? key,
    this.width = double.infinity,
    required this.title,
    required this.primaryColor,
    required this.secondaryColor,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final double width;
  final String title;
  final Color primaryColor;
  final Color secondaryColor;
  final IconData icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(kDefaultPadding),
        width: width,
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [kDefaultShadow]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: secondaryColor,
              size: 50,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: secondaryColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

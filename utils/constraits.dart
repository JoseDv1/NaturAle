import 'package:flutter/material.dart';

const kSecondaryColor = Colors.pinkAccent;
const kPrimaryColor = Colors.green;
const kBlackColor = Color.fromARGB(255, 0, 0, 0);
const kWhiteColor = Color.fromARGB(255, 255, 255, 255);

const double kDefaultPadding = 20.0;

const kDefaultShadow = BoxShadow(
  offset: Offset(0, 20),
  blurRadius: 5,
  color: Colors.black26, // Black color with 12% opacity
);

var kDefaultBackground = Container(
  decoration: const BoxDecoration(
      color: Colors.black,
      image: DecorationImage(
          image: AssetImage('lib/assets/images/Watermelon_BG.jpg'),
          fit: BoxFit.cover,
          opacity: 0.6)),
);

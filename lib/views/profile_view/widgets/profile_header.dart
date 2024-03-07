// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:naturale_app/utils/constraits.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key? key,
    this.name = "Nombre",
    this.email = "Correo",
  }) : super(key: key);

  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: kWhiteColor,
            ),
          ),
          Text(
            email,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: kWhiteColor,
            ),
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:naturale_app/utils/constraits.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  const Appbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: const Text(
        "Naturale Nutrición",
        style: TextStyle(
          color: kWhiteColor,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.person_rounded,
            color: kWhiteColor,
            size: 30,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/profile');
          },
        )
      ],
    );
  }

  @override // This is the size of the appbar
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

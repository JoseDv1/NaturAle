// ignore_for_file: must_be_immutable, avoid_print, unused_import, prefer_const_constructors_in_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:naturale_app/firebase/auth.dart';
import 'package:naturale_app/firebase/firestore.dart';
import 'package:naturale_app/utils/notifications.dart';

class DiaryFloatingButton extends StatelessWidget {
  DiaryFloatingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width: 75,
      child: FloatingActionButton(
        elevation: 1,
        onPressed: () {
          // Ir a la vista de agregar comida
          Navigator.pushNamed(context, '/add_food');
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }

  // Stop notifications

}

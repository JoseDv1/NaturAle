// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:naturale_app/firebase/firestore.dart';
import 'package:naturale_app/utils/constraits.dart';
import 'package:naturale_app/views/contact_view/widgets/contact_body.dart';

import 'package:naturale_app/utils/notifications.dart';

class ContactView extends StatelessWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Contacto'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.air, size: 30),
      ),
      body: Stack(
        children: [
          kDefaultBackground,
          ContactBody(),
        ],
      ),
    );
  }
}

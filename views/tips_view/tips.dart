// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:naturale_app/utils/constraits.dart';

import 'package:naturale_app/views/tips_view/widgets/tips_body.dart';

class TipsView extends StatelessWidget {
  const TipsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Tips',
            style: TextStyle(
              color: kWhiteColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: Stack(
        children: [
          kDefaultBackground,
          TipsBody(),
        ],
      ),
    );
  }
}

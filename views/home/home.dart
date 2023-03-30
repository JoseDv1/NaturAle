// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:naturale_app/utils/constraits.dart';
import 'package:naturale_app/views/home/widgets/appbar.dart';
import 'package:naturale_app/views/home/widgets/home_body.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: Appbar(),
      body: Stack(
        children: [
          kDefaultBackground,
          HomeBody(),
        ],
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:naturale_app/utils/constraits.dart';

import 'package:naturale_app/views/blog_view/widgets/blog_appbar.dart';
import 'package:naturale_app/views/blog_view/widgets/blog_home.dart';

class Blog extends StatelessWidget {
  const Blog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: BlogAppBar(),
      body: Stack(
        children: [
          kDefaultBackground,
          BlogHome(),
        ],
      ),
    );
  }
}

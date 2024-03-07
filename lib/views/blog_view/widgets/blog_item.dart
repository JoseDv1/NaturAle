// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:naturale_app/utils/constraits.dart';

class BlogItem extends StatelessWidget {
  const BlogItem({
    Key? key,
    required this.title,
    required this.content,
    required this.date,
    required this.uid,
  }) : super(key: key);

  final String title;
  final String content;
  final String date;
  final String uid;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      decoration: BoxDecoration(
        boxShadow: [kDefaultShadow],
        color: kWhiteColor,
      ),
      child: SingleChildScrollView(
        // Quita el circulo que aparece al hacer scroll
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: kDefaultPadding),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: kBlackColor,
              ),
            ),
            SizedBox(height: kDefaultPadding),
            SizedBox(
              width: double.infinity,
              child: Text(
                date,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[600],
                ),
              ),
            ),
            SizedBox(height: kDefaultPadding),
            // Contenido en Markdown
            MarkdownBody(
              data: content,
              styleSheet: MarkdownStyleSheet(
                textScaleFactor: 1.2,
                blockSpacing: 20,
              ),
            ),
            SizedBox(height: kDefaultPadding),
          ],
        ),
      ),
    );
  }
}

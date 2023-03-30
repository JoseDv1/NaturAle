// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:naturale_app/utils/constraits.dart';

import 'package:naturale_app/views/food_diary_view/widgets/diary_appbar.dart';
import 'package:naturale_app/views/food_diary_view/widgets/diary_body.dart';
import 'package:naturale_app/views/food_diary_view/widgets/diary_floating_button.dart';

class FoodDiary extends StatelessWidget {
  const FoodDiary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: DiaryAppBar(),
      floatingActionButton: DiaryFloatingButton(),
      body: Stack(
        children: [
          kDefaultBackground,
          DiaryBody(),
        ],
      ),
    );
  }
}

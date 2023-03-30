// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:naturale_app/utils/constraits.dart';
import 'package:naturale_app/views/food_diary_view/widgets/food.dart';
import 'package:naturale_app/firebase/firestore.dart';
import 'package:naturale_app/firebase/auth.dart';

class DiaryBody extends StatefulWidget {
  const DiaryBody({
    Key? key,
  }) : super(key: key);

  @override
  State<DiaryBody> createState() => _DiaryBodyState();
}

class _DiaryBodyState extends State<DiaryBody> {
  User? user = AuthenticationService().getCurrentUser();
  String userId = AuthenticationService().getCurrentUser()!.uid;
  //Food(title: "Bandeja Paisa", date: "25/01/2023", hour: "9:26"),

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: FirestoreService().getFoods(uid: userId),
            builder: (context, snapshot) => snapshot.hasData
                ? Column(
                    children: [
                      for (var food in snapshot.data!)
                        Food(
                          title: food['data']['title'],
                          date: food['data']['date'],
                          hour: food['data']['hour'],
                          place: food['data']['place'],
                          ingredients: food['data']['ingredients'],
                          preparation: food['data']['preparation'],
                          foodid: food['id'],
                        )
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ),
      ),
    );
  }
}

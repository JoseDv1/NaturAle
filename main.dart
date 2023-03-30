// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:naturale_app/firebase_options.dart';
import 'package:naturale_app/utils/constraits.dart';
import 'package:naturale_app/firebase/auth.dart';

// Firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:naturale_app/utils/notifications.dart';
import 'package:naturale_app/views/food_diary_view/add_food.dart';
import 'package:naturale_app/views/introduction_view/introduction.dart';

// Views
import 'package:naturale_app/views/login_page_view/login_page.dart';
import 'package:naturale_app/views/home/home.dart';
import 'package:naturale_app/views/login_page_view/register_page.dart';
import 'package:naturale_app/views/profile_view/profile.dart';

import 'package:naturale_app/views/recipes_view/recipes.dart';
import 'package:naturale_app/views/blog_view/blog.dart';
import 'package:naturale_app/views/food_diary_view/food_diary.dart';
import 'package:naturale_app/views/tips_view/tips.dart';
import 'package:naturale_app/views/contact_view/contact.dart';

void main() async {
  // Inicializa firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Inicializa las notificaciones
  await NotificationServices().initNotifications();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Naturale Nutrición",
      debugShowCheckedModeBanner: false,
      home: AuthWrapper(),
      theme: ThemeData(
        primaryColor: kPrimaryColor[100],
        scaffoldBackgroundColor: kSecondaryColor[100],
        fontFamily: "Poppins",
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: kBlackColor),
          bodyText2: TextStyle(color: kBlackColor),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/recipes': (BuildContext context) => Recetas(),
        '/blog': (BuildContext context) => const Blog(),
        '/food_diary': (BuildContext context) => const FoodDiary(),
        '/tips': (BuildContext context) => const TipsView(),
        '/contact': (BuildContext context) => const ContactView(),
        '/login': (BuildContext context) => LoginPage(),
        '/register': (BuildContext context) => RegisterPage(),
        '/profile': (BuildContext context) => const ProfileView(),
        '/introduction': (BuildContext context) => const Introduction(),
        '/add_food': (BuildContext context) => const AddFood(),
      },
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User? firebaseUser = AuthenticationService().getCurrentUser();

    // Si no hay usuario registrado lleva a la página de login
    if (firebaseUser == null) {
      return LoginPage();
    }

    // Si el usuario no tiene nombre lleva a la página de introducción
    if (firebaseUser.displayName == '' || firebaseUser.displayName == null) {
      return Introduction();
    }

    // Si el usuario tiene nombre lleva a la página de inicio
    return Home();
  }
}

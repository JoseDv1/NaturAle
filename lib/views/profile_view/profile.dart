// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:naturale_app/utils/constraits.dart';
import 'package:naturale_app/views/profile_view/widgets/profile_body.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Perfil'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          kDefaultBackground,
          ProfileBody(),
        ],
      ),
    );
  }
}

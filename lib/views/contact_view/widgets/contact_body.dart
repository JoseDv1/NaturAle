// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:naturale_app/utils/constraits.dart';
import 'package:url_launcher/url_launcher.dart';

import 'contact_info_card.dart';

class ContactBody extends StatelessWidget {
  ContactBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ContactInfoCard(),
            SizedBox(
              height: kDefaultPadding,
            ),
            PhoneCard(),
            SizedBox(
              height: kDefaultPadding,
            ),
            InstagramCard(),
          ],
        ),
      ),
    );
  }
}

class PhoneCard extends StatelessWidget {
  PhoneCard({
    Key? key,
  }) : super(key: key);

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  final Uri _url = Uri(
    scheme: 'tel',
    path: '+573217193374',
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(kDefaultPadding),
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.13),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(Icons.phone),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Telefono",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () => _launchUrl(),
            child: Text(
              "+57 321 719 3374",
              style: TextStyle(
                fontSize: 18,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class InstagramCard extends StatelessWidget {
  InstagramCard({
    Key? key,
  }) : super(key: key);

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  final Uri _url = Uri(
    scheme: 'https',
    path: '//www.instagram.com/natur.ale.nutricion/',
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () => _launchUrl(),
            child: Text(
              "@Natur.Ale.Nutricion",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              Text(
                "Instagram",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                padding: EdgeInsets.all(kDefaultPadding),
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.13),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(Icons.camera_alt_outlined),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

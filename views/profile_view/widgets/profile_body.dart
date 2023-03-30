// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:naturale_app/firebase/auth.dart';
import 'package:naturale_app/firebase/firestore.dart';
import 'package:naturale_app/utils/constraits.dart';
import 'package:naturale_app/views/profile_view/widgets/info_card.dart';
import 'package:naturale_app/views/profile_view/widgets/profile_header.dart';

import 'package:url_launcher/url_launcher.dart';

class ProfileBody extends StatelessWidget {
  ProfileBody({
    Key? key,
  }) : super(key: key);

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  final Uri _url = Uri(
    scheme: 'mailto',
    path: 'jose123millon@gmail.com',
    query: encodeQueryParameters(<String, String>{
      'subject': 'Problema con la app de Naturale Nutricion',
      'body':
          '¡Hola, José David! (Desarrolador de la app)  Tengo un problema con la aplicación de Naturale:',
    }),
  );

  @override
  Widget build(BuildContext context) {
    User? user = AuthenticationService().getCurrentUser();
    String? email = user?.email;
    String? name = user?.displayName;

    return SafeArea(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                ProfileHeader(
                  email: email!,
                  name: name!,
                ),
                // Info card
                FutureBuilder(
                    future: FirestoreService().getUser(uid: user!.uid),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return InfoCard(
                          age: snapshot.data?['edad'],
                          genre: snapshot.data?['genero'],
                          height: snapshot.data?['height'],
                          weight: snapshot.data?['weight'],
                          municipality: snapshot.data?['municipio'],
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
                // Logout button
                Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Logout
                        ListTile(
                          leading: const Icon(Icons.logout),
                          title: const Text('Logout'),
                          onTap: () async {
                            await AuthenticationService().signOut();
                            // Navigate to home and cant go back to this page
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/',
                              (route) => false,
                            );
                          },
                        ),
                        // Reportar un error
                        ListTile(
                          leading: const Icon(Icons.error),
                          title: const Text(
                              'Reportar un error o sugerir una mejora'),
                          onTap: () => _launchUrl(),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}

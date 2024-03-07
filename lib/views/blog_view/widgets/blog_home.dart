// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:naturale_app/firebase/firestore.dart';
import 'package:naturale_app/views/blog_view/widgets/blog_item.dart';

class BlogHome extends StatelessWidget {
  const BlogHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the data from Firestore
    final query = FirestoreService().getBlogs();
    // Use FutureBuilder to get the data from Firestore
    return FutureBuilder(
      future: query,
      builder: (context, snapshot) {
        // Check if the data was retrieved successfully
        if (snapshot.hasData) {
          return SafeArea(
            child: PageView(
              physics: BouncingScrollPhysics(),
              children: [
                // Create a Recipe widget for each recipe in the database
                for (var blog in snapshot.data!)
                  BlogItem(
                    title: blog['data']['title'],
                    date: blog['data']['date'],
                    content: blog['data']['content'],
                    uid: blog['id'],
                  ),
              ],
            ),
          );
        } else {
          // Show a loading indicator while the data is retrieved
          return const Center(
              child: CircularProgressIndicator(color: Colors.white));
        }
      },
    );
  }
}

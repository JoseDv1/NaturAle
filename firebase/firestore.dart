// ignore_for_file: avoid_print, non_constant_identifier_names, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

// ---------------------- General ----------------------
  // Create a new document in a collection
  Future<void> setData(
      {required String path, required Map<String, dynamic> data}) async {
    _db.collection(path).add(data);
  }

  // Read a document from a collection
  Future<List> getCollectionData(
    String collection,
  ) async {
    List data = [];
    CollectionReference documentReference = _db.collection(collection);
    QuerySnapshot querySnapshot = await documentReference.get();
    for (var doc in querySnapshot.docs) {
      data.add(doc.data());
    }
    return data;
  }

  // Update a document in a collection
  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
    required String doc,
  }) async {
    _db.collection(path).doc(doc).update(data);
  }

  // ---------------------- Recipes ----------------------
  // Read Recipes by ingredients
  Future<List> getRecipesByTags(
    List<String> tags,
  ) async {
    CollectionReference documentReference = _db.collection('recipes');
    QuerySnapshot querySnapshot =
        await documentReference.where('tags', arrayContainsAny: tags).get();
    List data = [];
    for (var doc in querySnapshot.docs) {
      data.add(doc.data());
    }

    return data;
  }

  // ---------------------- Users ----------------------
  // Save a User to the database
  Future<void> saveUser({
    required String uid,
    required String email,
    required createdAt,
  }) async {
    await _db.collection('users').doc(uid).set({
      'uid': uid,
      'email': email,
      'createdAt': createdAt,
    });
  }

  // Read a User from the database
  Future<Map<String, dynamic>> getUser({required String uid}) async {
    DocumentReference documentReference = _db.collection('users').doc(uid);
    DocumentSnapshot documentSnapshot = await documentReference.get();
    return documentSnapshot.data() as Map<String, dynamic>;
  }

  // Update a user in the database
  Future<void> updateUser({
    required User user,
    required Map<String, Object> data,
  }) async {
    await _db.collection('users').doc(user.uid).update(data);
  }

  // ---------------------- Food Diary ----------------------
  // Save a Food in the user database (food diary)
  Future<void> addFood({
    required String uid,
    required String title,
    required String place,
    required String ingredients,
    required String preparation,
  }) async {
    await _db.collection('users').doc(uid).collection('food_diary').add({
      'title': title,
      'place': place,
      'ingredients': ingredients,
      'preparation': preparation,
      'date':
          '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
      'hour': '${DateTime.now().hour}:${DateTime.now().minute}',
    });
  }

  // Read a Food from the user database (food diary) by uid and food id (doc)
  Future<List> getFoods({required String uid}) async {
    List data = [];
    CollectionReference documentReference =
        _db.collection('users').doc(uid).collection('food_diary');
    QuerySnapshot querySnapshot = await documentReference.get();
    for (var doc in querySnapshot.docs) {
      data.add({
        "id": doc.id,
        "data": doc.data(),
      });
    }
    return data;
  }

  // Update a Food from the user database (food diary) by uid and food id (doc)
  Future<void> updateFood({
    required String uid,
    required String doc,
    required String title,
    required String place,
    required String ingredients,
    required String preparation,
  }) async {
    await _db
        .collection('users')
        .doc(uid)
        .collection('food_diary')
        .doc(doc)
        .update({
      'title': title,
      'place': place,
      'ingredients': ingredients,
      'preparation': preparation,
    });
  }

  // Delete a Food from the user database (food diary) by uid and food id (doc)
  Future<void> deleteFood({
    required String uid,
    required String doc,
  }) async {
    await _db
        .collection('users')
        .doc(uid)
        .collection('food_diary')
        .doc(doc)
        .delete();
  }

  // ---------------------- Blogs ----------------------

  // Save a Blog in the database
  Future<void> addBlog({
    required String title,
    required String content,
    required List<String> tags,
  }) async {
    await _db.collection('blogs').add({
      'title': title,
      'content': content,
      'tags': tags,
      'date':
          '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
    });
  }

  // Read blogs from the database
  Future<List> getBlogs() async {
    List data = [];
    CollectionReference documentReference = _db.collection('blogs');
    QuerySnapshot querySnapshot = await documentReference.get();
    for (var doc in querySnapshot.docs) {
      data.add({
        "id": doc.id,
        "data": doc.data(),
      });
    }
    return data;
  }

  // Update a Blog from the database
  Future<void> updateBlog({
    required String doc,
    required String title,
    required String content,
    required List<String> tags,
  }) async {
    await _db.collection('blogs').doc(doc).update({
      'title': title,
      'content': content,
      'tags': tags,
    });
  }

  // Delete a Blog from the database
  Future<void> deleteBlog({
    required String doc,
  }) async {
    await _db.collection('blogs').doc(doc).delete();
  }
}

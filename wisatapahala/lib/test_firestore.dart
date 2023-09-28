import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TestFirestore extends StatefulWidget {
  const TestFirestore({super.key});

  @override
  State<TestFirestore> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<TestFirestore> {
  var db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Create a new user with a first and last name
          final user = <String, dynamic>{
            "first": "Ada",
            "last": "Lovelace",
            "born": 1815
          };

          // Add a new document with a generated ID
          db.collection("users").add(user).then((DocumentReference doc) =>
              print('DocumentSnapshot added with ID: ${doc.id}'));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

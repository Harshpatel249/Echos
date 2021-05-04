//A model for user data

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String username;
  // DateTime timestamp;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.username,
    // this.timestamp,
  });

  // Method for deserialising the data.
  // Responsible for taking a documents snapshot and turning it into an instance of a user class.
  // factory is kinda static method which will be available on User class
  factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel(
      id: doc['id'],
      name: doc['name'],
      email: doc['email'],
      username: doc['username'],
      // timestamp: DateTime.fromMillisecondsSinceEpoch(doc['joining_date'][0]),
    );
  }
  String getId() {
    return this.id;
  }

  String getName() {
    return this.name;
  }

  String getEmail() {
    return this.email;
  }

  String getUserName() {
    return this.username;
  }

  // DateTime getJoiningDate() {
  //   return this.timestamp;
  // }
}

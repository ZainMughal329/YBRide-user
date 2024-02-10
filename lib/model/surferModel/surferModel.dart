
import 'package:cloud_firestore/cloud_firestore.dart';

class SurferModel {
  String? id;
  final String userName;
  final String email;
  // final String password;
  SurferModel({
    this.id = '',
    required this.userName,
    required this.email,
    // required this.password,
  });
  toJson() {
    return {
      'userName':userName,
      'id': id,
      'Email': email,
      // 'Password': password,
    };
  }
  factory SurferModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final data = documentSnapshot.data()!;
    return SurferModel(
      userName: data['userName'],
      id: data['id'],
      email: data['Email'],
      // password: data['Password'],
    );
  }
}

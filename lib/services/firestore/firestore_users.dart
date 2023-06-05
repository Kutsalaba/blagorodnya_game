import 'package:blagorodnya_game/views/login/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreUsers {
  static saveUser(String iud, UserModel user) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(iud)
        .set(user.toJson());
  }
}

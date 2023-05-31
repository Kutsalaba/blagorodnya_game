import 'package:blagorodnya_game/views/login/models/user.dart';
import 'package:blagorodnya_game/views/login/repositories/auth_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthRepositoryImpl implements AuthRepositoryI {
  late UserModel? userModel;

  AuthRepositoryImpl._();

  static final AuthRepositoryImpl _instance = AuthRepositoryImpl._();

  factory AuthRepositoryImpl() {
    return _instance;
  }

  @override
  Future<void> getUserData(String userId) async {
    try {
      var userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (userData.exists) {
        var data = userData.data();
        userModel = UserModel.fromJson(data!);
      }
    } catch (e) {
      print('Failed to get user data: $e');
    }
  }
}

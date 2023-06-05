import 'package:blagorodnya_game/views/login/models/user.dart';
import 'package:blagorodnya_game/views/login/models/user_params.dart';
import 'package:blagorodnya_game/views/login/repositories/auth_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepositoryImpl implements AuthRepositoryI {
  late UserModel? userModel;

  UserRepositoryImpl._();

  static final UserRepositoryImpl _instance = UserRepositoryImpl._();

  factory UserRepositoryImpl() {
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
      throw Exception('Failed to get user data: $e');
    }
  }

  @override
  Future<void> upgradeUserData(String email, UserParams userParams) async {
    var usersCollection = FirebaseFirestore.instance.collection('users');
    var snapshot = await usersCollection.where('email', isEqualTo: email).get();
    var userDocument = snapshot.docs.first;
    var currentUser = UserModel.fromJson(userDocument.data());

    var updatedUser = currentUser.copyWith(
      gameScore: currentUser.gameScore > userParams.gameScore
          ? currentUser.gameScore
          : userParams.gameScore,
      spendTime: currentUser.spendTime + userParams.spendTime,
    );

    await userDocument.reference.update(updatedUser.toJson());
  }
}

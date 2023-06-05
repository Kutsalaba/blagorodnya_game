import 'package:blagorodnya_game/views/login/models/user_params.dart';

abstract class UserRepositoryI {
  Future<void> getUserData(String userId);
  Future<void> upgradeUserData(String email, UserParams userParams);
}

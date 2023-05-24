import 'package:blagorodnya_game/auth/auth.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'autentication_state.dart';

class AuthenticationCubit extends Cubit<bool> {
  AuthenticationCubit() : super(false);

  void login(
    String email,
    String password,
    BuildContext context,
    Function function,
  ) async {
    try {
      await AuthServices.signinUser(email, password, context);

      if (FirebaseAuth.instance.currentUser != null) {
        emit(true);
        function.call();
      }
    } catch (e) {
      print('Login failed: $e');
    }
  }

  void signup(
    String email,
    String password,
    String fullname,
    BuildContext context,
    Function function,
  ) async {
    try {
      await AuthServices.signupUser(email, password, fullname, context);

      if (FirebaseAuth.instance.currentUser != null) {
        emit(true);
        function.call();
      }
    } catch (e) {
      print('Signup failed: $e');
    }
  }

  void logout(Function function) async {
    try {
      await FirebaseAuth.instance.signOut();
      emit(false);
      function.call();
    } catch (e) {
      print('Logout failed: $e');
    }
  }
}

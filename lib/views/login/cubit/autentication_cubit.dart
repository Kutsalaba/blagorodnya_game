import 'package:blagorodnya_game/auth/auth.dart';
import 'package:blagorodnya_game/views/login/repositories/auth_repository_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'autentication_state.dart';

class AuthenticationCubit extends Cubit<bool> {
  AuthenticationCubit() : super(false);
  AuthRepositoryImpl? _authRepository;

  AuthRepositoryImpl get authRepository => _authRepository!;

  Future<void> login(
    String email,
    String password,
    BuildContext context,
    Function function,
  ) async {
    try {
      await AuthServices.signinUser(email, password, context);

      if (FirebaseAuth.instance.currentUser != null) {
        _setAuthRepo.call();
        emit(true);
        saveAuthStatus(true);
        function.call();
      }
    } catch (e) {
      print('Login failed: $e');
    }
  }

  Future<void> signup(
    String email,
    String password,
    String fullname,
    BuildContext context,
    Function function,
  ) async {
    try {
      await AuthServices.signupUser(email, password, fullname, context);
      var user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        _setAuthRepo.call();
        emit(true);
        saveAuthStatus(true);
        function.call();
      }
    } catch (e) {
      print('Signup failed: $e');
    }
  }

  Future<void> logout(Function function) async {
    try {
      await FirebaseAuth.instance.signOut();
      emit(false);
      saveAuthStatus(false);
      function.call();
    } catch (e) {
      print('Logout failed: $e');
    }
  }

  void _setAuthRepo() {
    _authRepository ??= AuthRepositoryImpl();
  }

  Future<void> checkAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final bool isAuthenticated = prefs.getBool('isAuthenticated') ?? false;

    if (isAuthenticated) {
      _setAuthRepo();
      emit(true);
    }
  }

  Future<void> saveAuthStatus(bool isAuthenticated) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isAuthenticated', isAuthenticated);
  }
}

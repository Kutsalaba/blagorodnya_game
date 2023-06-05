import 'package:blagorodnya_game/auth/auth.dart';
import 'package:blagorodnya_game/views/login/repositories/user_repository_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(UnauthorizedState());
  UserRepositoryImpl? _authRepository;

  UserRepositoryImpl get authRepository => _authRepository!;

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
        emit(AuthorizedState());
        saveAuthStatus(true);
        function.call();
      }
    } catch (e) {
      throw Exception('Login failed: $e');
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
        emit(AuthorizedState());
        saveAuthStatus(true);
        function.call();
      }
    } catch (e) {
      throw Exception('Signup failed: $e');
    }
  }

  Future<void> logout(Function function) async {
    try {
      await FirebaseAuth.instance.signOut();
      emit(UnauthorizedState());
      saveAuthStatus(false);
      function.call();
    } catch (e) {
      throw Exception('Logout failed: $e');
    }
  }

  void _setAuthRepo() {
    _authRepository ??= UserRepositoryImpl();
  }

  Future<void> checkAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final bool isAuthenticated = prefs.getBool('isAuthenticated') ?? false;

    if (isAuthenticated) {
      _setAuthRepo();
      emit(AuthorizedState());
    }
  }

  Future<void> saveAuthStatus(bool isAuthenticated) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isAuthenticated', isAuthenticated);
  }
}

import 'package:blagorodnya_game/styles/app_colors.dart';
import 'package:blagorodnya_game/views/cubit/page_cubit.dart';
import 'package:blagorodnya_game/views/login/cubit/autentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String nickname = '';
  bool login = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Text(
              login ? 'Log in' : 'Sign Up',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: const Offset(1.5, 1.5),
                    blurRadius: 2,
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: !login,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: TextFormField(
                key: const ValueKey('nickname'),
                style: const TextStyle(
                  color: AppColors.overGrowthColor,
                  fontSize: 16.0,
                ),
                decoration: _textInputDecor(
                  'Nickname',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Full Name';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  setState(() {
                    nickname = value!;
                  });
                },
              ),
            ),
          ),
          TextFormField(
            key: const ValueKey('email'),
            style: const TextStyle(
              color: AppColors.overGrowthColor,
              fontSize: 16.0,
            ),
            onSaved: (value) {
              setState(() {
                email = value!;
              });
            },
            validator: (value) {
              if (value!.isEmpty || !value.contains('@')) {
                return 'Please Enter valid Email';
              } else {
                return null;
              }
            },
            decoration: _textInputDecor('email'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: TextFormField(
              style: const TextStyle(
                color: AppColors.overGrowthColor,
                fontSize: 16.0,
              ),
              key: const ValueKey('password'),
              onSaved: (value) {
                setState(() {
                  password = value!;
                });
              },
              validator: (value) {
                if (value!.length < 6) {
                  return 'Please Enter Password of min length 6';
                } else {
                  return null;
                }
              },
              decoration: _textInputDecor('password'),
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  if (login) {
                    context.read<AuthenticationCubit>().login(
                          email,
                          password,
                          context,
                          () => context.read<PageCubit>().goToHome(),
                        );
                  } else {
                    context.read<AuthenticationCubit>().signup(
                          email,
                          password,
                          nickname,
                          context,
                          () => context.read<PageCubit>().goToHome(),
                        );
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade600,
                foregroundColor: Colors.white,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Text(
                login ? 'Log in' : 'Sign Up',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Colors.white,
                      fontSize: 28,
                    ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ResponsiveRowColumn(
            layout: ResponsiveRowColumnType.ROW,
            rowMainAxisAlignment: MainAxisAlignment.center,
            children: [
              ResponsiveRowColumnItem(
                child: Text(
                  login
                      ? 'Don\'t have an account? '
                      : 'Already have an account? ',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
              ResponsiveRowColumnItem(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      login = !login;
                    });
                  },
                  child: Text.rich(
                    TextSpan(
                      text: login ? 'Signup' : 'Login',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  InputDecoration _textInputDecor(String text) {
    return InputDecoration(
      filled: true,
      fillColor: AppColors.incrementalBlueColor,
      hintText: text,
      hintStyle: const TextStyle(
        color: AppColors.overGrowthColor,
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 16.0,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          color: AppColors.incrementalBlueColor,
          width: 1.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          color: Colors.blue,
          width: 2.0,
        ),
      ),
    );
  }
}

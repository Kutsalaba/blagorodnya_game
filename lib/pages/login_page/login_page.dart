import 'package:blagorodnya_game/auth/auth.dart';
import 'package:blagorodnya_game/routes/app_route_constants.dart';
import 'package:blagorodnya_game/widgets/app_bar/main_app_bar.dart';
import 'package:blagorodnya_game/widgets/app_gradient_background.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String fullname = '';
  bool login = false;

  @override
  Widget build(BuildContext context) {
    return 
      // appBar: MainAppBar(isLogged: login),
      AppGradientBackground(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ======== Full Name ========
                login
                    ? Container()
                    : TextFormField(
                        key: const ValueKey('fullname'),
                        decoration: const InputDecoration(
                          hintText: 'Enter Full Name',
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
                            fullname = value!;
                          });
                        },
                      ),

                // ======== Email ========
                TextFormField(
                  key: const ValueKey('email'),
                  decoration: const InputDecoration(
                    hintText: 'Enter Email',
                  ),
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Please Enter valid Email';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      email = value!;
                    });
                  },
                ),
                // ======== Password ========
                TextFormField(
                  key: const ValueKey('password'),
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Enter Password',
                  ),
                  validator: (value) {
                    if (value!.length < 6) {
                      return 'Please Enter Password of min length 6';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      password = value!;
                    });
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        login
                            ? AuthServices.signinUser(email, password, context)
                            : AuthServices.signupUser(
                                email, password, fullname, context);

                        if (FirebaseAuth.instance.currentUser != null) {
                          GoRouter.of(context)
                              .go(AppRouteConstants.homeRoutePath);
                        }
                      }
                    },
                    child: Text(login ? 'Login' : 'Signup'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        login = !login;
                      });
                    },
                    child: Text(login
                        ? "Don't have an account? Signup"
                        : "Already have an account? Login"))
              ],
            ),
          ),
        ),
      
    );
  }
}

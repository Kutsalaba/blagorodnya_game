import 'package:blagorodnya_game/pages/cubit/page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DefaultPage extends StatelessWidget {
  const DefaultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Example'),
      ),
      body: BlocBuilder<PageCubit, PageState>(
        builder: (context, state) {
          if (state is LoginPage) {
            return const Center(
              child: Text('Login Page'),
            );
          } else if (state is HomePage) {
            return const Center(
              child: Text('Home Page'),
            );
          } else if (state is ProfilePage) {
            return const Center(
              child: Text('Profile Page'),
            );
          }

          return Container();
        },
      ),
      bottomNavigationBar: BlocBuilder<PageCubit, PageState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: _currentIndexFromState(state),
            onTap: (index) {
              if (index == 0) {
                context.read<PageCubit>().goToHome();
              } else if (index == 1) {
                context.read<PageCubit>().goToLogin();
              } else if (index == 2) {
                context.read<PageCubit>().goToProfile();
              }
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.login),
                label: 'Login',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          );
        },
      ),
    );
  }

  int _currentIndexFromState(PageState state) {
    if (state is HomePage) {
      return 0;
    } else if (state is LoginPage) {
      return 1;
    } else if (state is ProfilePage) {
      return 2;
    }

    return 0; 
  }
}

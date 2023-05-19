import 'package:flutter/material.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Text('It is working'),
        Expanded(
          child: Center(
            child: Text('Join Course'),
          ),
        )
      ],
    );
  }
}
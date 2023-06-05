import 'package:blagorodnya_game/views/layout_template/layout_template_body.dart';
import 'package:blagorodnya_game/views/login/cubit/autentication_cubit.dart';
import 'package:blagorodnya_game/widgets/app_bar/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthenticationCubit>();
    Future.microtask(() async => await authCubit.checkAuthStatus());
    return const Scaffold(
      appBar: MainAppBar(),
      body: LayoutTemplateBody(),
    );
  }
}

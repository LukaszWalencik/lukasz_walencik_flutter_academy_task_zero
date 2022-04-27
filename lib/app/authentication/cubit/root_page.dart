import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lukasz_walencik_flutter_academy_task_zero/app/authentication/cubit/authentication_cubit.dart';
import 'package:lukasz_walencik_flutter_academy_task_zero/features/login_page/login_page.dart';
import 'package:lukasz_walencik_flutter_academy_task_zero/features/pulpit_page/pulpit.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit()..authentication(),
      child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) {
          final user = state.user;

          if (user == null) {
            return const LoginPage();
          }
          return const Pulpit();
        },
      ),
    );
  }
}

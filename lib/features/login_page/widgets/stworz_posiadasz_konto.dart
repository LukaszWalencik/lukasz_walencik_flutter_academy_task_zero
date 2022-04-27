import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lukasz_walencik_flutter_academy_task_zero/features/login_page/cubit/login_cubit.dart';

Flexible StworzPosiadaszKonto(BuildContext context, LoginState state) {
  return Flexible(
    child: TextButton(
      style: TextButton.styleFrom(
        primary: Colors.purple,
      ),
      onPressed: () {
        context.read<LoginCubit>().createAccount(state.creatingAccount);
      },
      child: Text(
          state.creatingAccount == false ? 'Stwórz konto' : 'Posiadasz konto?'),
    ),
  );
}

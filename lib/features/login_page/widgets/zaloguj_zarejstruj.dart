import 'package:flutter/material.dart';
import 'package:lukasz_walencik_flutter_academy_task_zero/features/login_page/cubit/login_cubit.dart';

Flexible ZalogujZarejestruj(LoginState state) {
  return Flexible(
    child: Text(
      state.creatingAccount == false ? 'Zaloguj się' : 'Zarejestruj się',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lukasz_walencik_flutter_academy_task_zero/features/login_page/cubit/login_cubit.dart';
import 'package:lukasz_walencik_flutter_academy_task_zero/features/login_page/widgets/new_old_acc.dart';
import 'package:lukasz_walencik_flutter_academy_task_zero/features/login_page/widgets/sign_in_up_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var errorMessage = '';
  var isCreatingAccount = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.purple,
              title: const Text(
                'Flutter Academy Task Zero',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            body: Container(
              color: Colors.black12,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SignInUpText(state),
                      const Flexible(
                        child: SizedBox(
                          height: 50,
                        ),
                      ),
                      EmailTextField(),
                      const Flexible(
                        child: SizedBox(
                          height: 15,
                        ),
                      ),
                      PasswordTextField(),
                      const Flexible(
                        child: SizedBox(
                          height: 20,
                        ),
                      ),
                      Text(
                        state.errorMessage,
                        style: const TextStyle(color: Colors.red),
                      ),
                      const Flexible(
                        child: SizedBox(
                          height: 20,
                        ),
                      ),
                      SignInUpButton(state, context),
                      const Flexible(
                        child: SizedBox(
                          height: 20,
                        ),
                      ),
                      NewOldAcc(context, state)
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Flexible EmailTextField() {
    return Flexible(
      child: TextField(
        controller: emailController,
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.person,
            color: Colors.purple,
          ),
          hintText: 'Email',
        ),
      ),
    );
  }

  Flexible PasswordTextField() {
    return Flexible(
      child: TextField(
        obscureText: true,
        controller: passwordController,
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.vpn_key,
            color: Colors.purple,
          ),
          hintText: 'Password',
        ),
      ),
    );
  }

  Flexible SignInUpButton(LoginState state, BuildContext context) {
    return Flexible(
      child: ElevatedButton(
          onPressed: state.creatingAccount
              ? () {
                  context
                      .read<LoginCubit>()
                      .signUp(emailController.text, passwordController.text);
                }
              : () {
                  context
                      .read<LoginCubit>()
                      .singIn(emailController.text, passwordController.text);
                },
          child: Text(
            state.creatingAccount == false ? 'Zaloguj' : 'Rejestracja',
          ),
          style: ElevatedButton.styleFrom(primary: Colors.purple)),
    );
  }
}

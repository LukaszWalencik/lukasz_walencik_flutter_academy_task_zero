import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lukasz_walencik_flutter_academy_task_zero/features/login_page/cubit/login_cubit.dart';

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
                      Flexible(
                        child: Text(
                          state.creatingAccount == false
                              ? 'Zaloguj się'
                              : 'Zarejestruj się',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const Flexible(
                        child: SizedBox(
                          height: 50,
                        ),
                      ),
                      Flexible(
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
                      ),
                      const Flexible(
                        child: SizedBox(
                          height: 15,
                        ),
                      ),
                      Flexible(
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
                      ),
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
                      Flexible(
                        child: ElevatedButton(
                            onPressed: state.creatingAccount
                                ? () {
                                    context.read<LoginCubit>().signUp(
                                        emailController.text,
                                        passwordController.text);
                                  }
                                : () {
                                    context.read<LoginCubit>().singIn(
                                        emailController.text,
                                        passwordController.text);
                                  },
                            child: Text(
                              state.creatingAccount == false
                                  ? 'Zaloguj'
                                  : 'Rejestracja',
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.purple)),
                      ),
                      const Flexible(
                        child: SizedBox(
                          height: 20,
                        ),
                      ),
                      Flexible(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.purple,
                          ),
                          onPressed: () {
                            context
                                .read<LoginCubit>()
                                .createAccount(state.creatingAccount);
                          },
                          child: Text(state.creatingAccount == false
                              ? 'Stwórz konto'
                              : 'Posiadasz konto?'),
                        ),
                      )
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
}


 // child: ElevatedButton(
                  //     onPressed: () async {
                  //       if (isCreatingAccount == true)
                  //         try {
                  //           await FirebaseAuth.instance
                  //               .signInWithEmailAndPassword(
                  //                   email: emailController.text,
                  //                   password: passwordController.text);
                  //         } catch (error) {
                  //           setState(() {
                  //             errorMessage = error.toString();
                  //           });
                  //           ;
                  //         }
                  //       if (isCreatingAccount == false)
                  //         try {
                  //           await FirebaseAuth.instance
                  //               .createUserWithEmailAndPassword(
                  //                   email: emailController.text,
                  //                   password: passwordController.text);
                  //         } catch (error) {
                  //           setState(() {
                  //             errorMessage = error.toString();
                  //           });
                  //           ;
                  //         }
                  //     },
                  //     child: Text(
                  //       isCreatingAccount == true
                  //           ? 'Zaloguj się'
                  //           : 'Zarejestruj się',
                  //     ),

                  
                      // if (isCreatingAccount == true) ...[
                      //   Flexible(
                      //     child: TextButton(
                      //       style: TextButton.styleFrom(
                      //         primary: Colors.purple,
                      //       ),
                      //       onPressed: () {
                      //         setState(() {
                      //           isCreatingAccount = false;
                      //         });
                      //       },
                      //       child: Text(
                      //         'Stwórz konto',
                      //       ),
                      //     ),
                      //   )
                      // ] else
                      //   Flexible(
                      //     child: TextButton(
                      //       style: TextButton.styleFrom(
                      //         primary: Colors.purple,
                      //       ),
                      //       onPressed: () {
                      //         setState(() {
                      //           isCreatingAccount = true;
                      //         });
                      //       },
                      //       child: Text(
                      //         'Masz juz konto?',
                      //       ),
                      //     ),
                      //   )
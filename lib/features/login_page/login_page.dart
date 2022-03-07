import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

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
                    isCreatingAccount == true
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
                  errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
                const Flexible(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                Flexible(
                  child: ElevatedButton(
                      onPressed: () async {
                        if (isCreatingAccount == true)
                          try {
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text);
                          } catch (error) {
                            setState(() {
                              errorMessage = error.toString();
                            });
                            ;
                          }
                        if (isCreatingAccount == false)
                          try {
                            await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text);
                          } catch (error) {
                            setState(() {
                              errorMessage = error.toString();
                            });
                            ;
                          }
                      },
                      child: Text(
                        isCreatingAccount == true
                            ? 'Zaloguj się'
                            : 'Zarejestruj się',
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.purple)),
                ),
                const Flexible(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                if (isCreatingAccount == true) ...[
                  Flexible(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.purple,
                      ),
                      onPressed: () {
                        setState(() {
                          isCreatingAccount = false;
                        });
                      },
                      child: Text(
                        'Stwórz konto',
                      ),
                    ),
                  )
                ] else
                  Flexible(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.purple,
                      ),
                      onPressed: () {
                        setState(() {
                          isCreatingAccount = true;
                        });
                      },
                      child: Text(
                        'Masz juz konto?',
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

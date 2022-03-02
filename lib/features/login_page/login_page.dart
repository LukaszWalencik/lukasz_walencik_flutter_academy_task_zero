import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: const Text(
          'My Books to Read',
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
                    'Zaloguj się',
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
                Flexible(
                  child: ElevatedButton(
                      onPressed: () async {
                        try {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text);
                        } catch (error) {
                          print(error);
                        }
                      },
                      child: Text('Zaloguj się'),
                      style: ElevatedButton.styleFrom(primary: Colors.purple)),
                ),
                const Flexible(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                Flexible(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(''),
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

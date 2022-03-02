import 'package:flutter/material.dart';
import 'package:lukasz_walencik_flutter_academy_task_zero/features/login_page/login_page.dart';
import 'package:lukasz_walencik_flutter_academy_task_zero/features/pulpit_page/pulpit.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            final user = snapshot.data;
            if (user == null) {
              return LoginPage();
            }
            return Pulpit();
          }),
    );
  }
}

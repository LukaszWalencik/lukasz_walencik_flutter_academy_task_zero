import 'package:flutter/material.dart';
import 'package:lukasz_walencik_flutter_academy_task_zero/app/authentication/cubit/root_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RootPage(),
    );
  }
}

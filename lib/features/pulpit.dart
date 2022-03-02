import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

import 'package:lukasz_walencik_flutter_academy_task_zero/features/cubit/pulpit_cubit.dart';

class Pulpit extends StatefulWidget {
  const Pulpit({
    Key? key,
  }) : super(key: key);

  @override
  State<Pulpit> createState() => _PulpitState();
}

class _PulpitState extends State<Pulpit> {
  // List<Color> colors = [Colors.blue, Colors.black, Colors.green];

  var defaultColor = Colors.amber;

  var borderWidth = 1.0;
  // var tapBorder = Random().nextDouble() * 5;

  // final numbers = <double>[2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0];

  var borderColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PulpitCubit(),
      child: BlocBuilder<PulpitCubit, PulpitState>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.purple,
                title: Text('Flutter Academy Task Zero'),
              ),
              backgroundColor: Colors.grey[400],
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  crossAxisCount: 3,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          defaultColor = Colors.primaries[
                              Random().nextInt(Colors.primaries.length)];
                          borderWidth = Random().nextDouble() * 5;
                          borderColor = Colors.primaries[
                              Random().nextInt(Colors.primaries.length)];
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: defaultColor,
                          border: Border.all(
                              width: borderWidth, color: borderColor),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(
                            "Łukasz",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: defaultColor,
                        border:
                            Border.all(width: borderWidth, color: borderColor),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              defaultColor = defaultColor;
                              borderWidth = Random().nextDouble() * 5;
                              ;
                              borderColor = Colors.primaries[
                                  Random().nextInt(Colors.primaries.length)];
                            });
                          },
                          child: const Text(
                              'Rozwinięcia swoich umiejętności i możliwości przyszłego zatrudnienia.')),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.black),
                        image: DecorationImage(
                          image: AssetImage("images/Foto.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      // child:
                      //     Image(image: AssetImage('images/Foto.jpg'), fit: BoxFit.fill),
                      // color: Colors.teal[300],
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: const Text('Who scream'),
                      color: Colors.teal[400],
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: const Text('Revolution is coming...'),
                      color: Colors.teal[500],
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.black),
                        image: DecorationImage(
                          image: AssetImage("images/snowboard.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: const Text('Who scream'),
                      color: Colors.teal[400],
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: const Text('Revolution is coming...'),
                      color: Colors.teal[500],
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: const Text('Revolution, they...'),
                      color: Colors.teal[600],
                    ),
                  ],
                  // children: [],
                ),
              ));
        },
      ),
    );
  }
}

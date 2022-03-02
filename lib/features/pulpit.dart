import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

import 'package:lukasz_walencik_flutter_academy_task_zero/features/cubit/pulpit_cubit.dart';

class Pulpit extends StatelessWidget {
  const Pulpit({
    Key? key,
  }) : super(key: key);

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
                    Container(
                      decoration: BoxDecoration(
                        color: state.inkColor,
                        border: Border.all(
                            width: state.borderWidth, color: state.borderColor),
                      ),
                      child: InkWell(
                        onTap: () {
                          context.read<PulpitCubit>().mixColors();
                        },
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
                        color: state.inkColor,
                        border: Border.all(
                            width: state.borderWidth, color: state.borderColor),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: InkWell(
                          onTap: () {
                            context.read<PulpitCubit>().mixColors2();
                          },
                          child: const Text(
                              'Rozwinięcia swoich umiejętności i możliwości przyszłego zatrudnienia.')),
                    ),
                    Container(
                      child: InkWell(onTap: () {
                        context.read<PulpitCubit>().mixColors();
                      }),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: state.borderWidth, color: state.borderColor),
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
                      decoration: BoxDecoration(
                        color: state.inkColor,
                        border: Border.all(
                            width: state.borderWidth, color: state.borderColor),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: InkWell(
                        onTap: () {
                          context.read<PulpitCubit>().mixColors2();
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: state.inkColor,
                        border: Border.all(
                            width: state.borderWidth, color: state.borderColor),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: InkWell(
                        onTap: () {
                          context.read<PulpitCubit>().mixColors2();
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: InkWell(
                        onTap: () {
                          context.read<PulpitCubit>().mixColors2();
                        },
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: state.borderWidth, color: state.borderColor),
                        image: DecorationImage(
                          image: AssetImage("images/snowboard.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: state.inkColor,
                        border: Border.all(
                            width: state.borderWidth, color: state.borderColor),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: InkWell(
                        onTap: () {
                          context.read<PulpitCubit>().mixColors2();
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: state.inkColor,
                        border: Border.all(
                            width: state.borderWidth, color: state.borderColor),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: InkWell(
                        onTap: () {
                          context.read<PulpitCubit>().mixColors2();
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: state.inkColor,
                        border: Border.all(
                            width: state.borderWidth, color: state.borderColor),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: InkWell(
                        onTap: () {
                          context.read<PulpitCubit>().mixColors2();
                        },
                      ),
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

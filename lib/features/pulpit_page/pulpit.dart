import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:math';

import 'package:lukasz_walencik_flutter_academy_task_zero/features/pulpit_page/cubit/pulpit_cubit.dart';

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
              actions: [
                IconButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                    },
                    icon: Icon(Icons.person))
              ],
              centerTitle: true,
              backgroundColor: Colors.purple,
              title: Text('Flutter Academy Task Zero'),
            ),
            backgroundColor: Colors.grey[400],
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: StaggeredGrid.count(
                crossAxisCount: 3,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                children: [
                  StaggeredGridTile.count(
                    crossAxisCellCount: 1,
                    mainAxisCellCount: 1,
                    child: Container(
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
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 1,
                    mainAxisCellCount: 1,
                    child: Container(
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
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 1,
                    mainAxisCellCount: 1,
                    child: Container(
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
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 1,
                    mainAxisCellCount: 1,
                    child: Container(
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
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 2,
                    child: Container(
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
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 1,
                    mainAxisCellCount: 1,
                    child: Container(
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
                  ),
                ],
              )),
            ),
          );
        },
      ),
    );
  }
}

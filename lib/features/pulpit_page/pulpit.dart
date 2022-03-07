import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:lukasz_walencik_flutter_academy_task_zero/features/pulpit_page/cubit/pulpit_cubit.dart';

class Pulpit extends StatelessWidget {
  const Pulpit({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PulpitCubit()..start(),
      child: BlocBuilder<PulpitCubit, PulpitState>(
        builder: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            return Text(state.errorMessage);
          }
          if (state.isLoading == true) {
            return const Center(child: CircularProgressIndicator());
          }
          final documents = state.documents;
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      context.read<PulpitCubit>().signOut();
                    },
                    icon: const Icon(Icons.person))
              ],
              centerTitle: true,
              backgroundColor: Colors.purple,
              title: const Text('Flutter Academy Task Zero'),
            ),
            backgroundColor: Colors.grey[400],
            body: Center(
              child: StaggeredGrid.count(
                crossAxisCount: 3,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                children: [
                  for (final document in documents) ...[
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: state.inkColor,
                          border: Border.all(
                              width: state.borderWidth,
                              color: state.borderColor),
                        ),
                        child: InkWell(
                          onTap: () {
                            context.read<PulpitCubit>().mixColors();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              document['name'],
                              style: const TextStyle(
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
                              width: state.borderWidth,
                              color: state.borderColor),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: InkWell(
                          onTap: () {
                            context.read<PulpitCubit>().mixColors();
                          },
                          child: Text(
                            document['info'],
                          ),
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: InkWell(
                          onTap: () {
                            context.read<PulpitCubit>().mixColors();
                          },
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: state.borderWidth,
                              color: state.borderColor),
                          image: const DecorationImage(
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
                              width: state.borderWidth,
                              color: state.borderColor),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: InkWell(
                          onTap: () {
                            context.read<PulpitCubit>().mixColors();
                          },
                        ),
                        // child: ElevatedButton(
                        //   onPressed: () {},
                        //   child: const Text('Naciśnij by podmienić'),
                        // ),
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
                              width: state.borderWidth,
                              color: state.borderColor),
                          image: const DecorationImage(
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
                        child: InkWell(
                          onTap: () {
                            context.read<PulpitCubit>().mixColors();
                          },
                          child: Image.network(
                            'https://ih1.redbubble.net/image.1060739513.9977/pp,840x830-pad,1000x1000,f8f8f8.u1.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: state.inkColor,
                          border: Border.all(
                              width: state.borderWidth,
                              color: state.borderColor),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

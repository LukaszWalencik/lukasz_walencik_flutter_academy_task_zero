import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lukasz_walencik_flutter_academy_task_zero/features/pulpit_page/cubit/pulpit_cubit.dart';
import 'package:lukasz_walencik_flutter_academy_task_zero/features/pulpit_page/widgets/kratka.dart';
import 'package:lukasz_walencik_flutter_academy_task_zero/repositories/item_repository.dart';

class Pulpit extends StatelessWidget {
  const Pulpit({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PulpitCubit(ItemRepository())..start(),
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
              child: Kratka(documents, state, context),
            ),
          );
        },
      ),
    );
  }
}

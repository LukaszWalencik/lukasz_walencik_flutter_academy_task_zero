import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:lukasz_walencik_flutter_academy_task_zero/models/item_model.dart';
import 'package:lukasz_walencik_flutter_academy_task_zero/repositories/item_repository.dart';
part 'pulpit_state.dart';

class PulpitCubit extends Cubit<PulpitState> {
  PulpitCubit(this._itemRepository)
      : super(const PulpitState(
            inkColor: Colors.amber,
            isLoading: false,
            errorMessage: '',
            borderWidth: 1.0,
            borderColor: Colors.black,
            documents: []));

  final ItemRepository _itemRepository;
  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const PulpitState(
        inkColor: Colors.amber,
        isLoading: true,
        errorMessage: '',
        borderWidth: 1.0,
        borderColor: Colors.black,
        documents: [],
      ),
    );

    _streamSubscription = _itemRepository.getItemsStream().listen(
      (data) {
        emit(
          PulpitState(
              inkColor: Colors.amber,
              isLoading: false,
              errorMessage: '',
              borderWidth: 1.0,
              borderColor: Colors.black,
              documents: data),
        );
      },
    )..onError(
        (error) {
          emit(
            PulpitState(
              inkColor: Colors.amber,
              isLoading: false,
              errorMessage: error.toString(),
              borderWidth: 1.0,
              borderColor: Colors.black,
              documents: const [],
            ),
          );
        },
      );
  }

  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
  }

  Future<void> mixColors() async {
    _streamSubscription = _itemRepository.getItemsStream().listen(
      (data) {
        emit(
          PulpitState(
              inkColor:
                  Colors.primaries[Random().nextInt(Colors.primaries.length)],
              isLoading: false,
              errorMessage: '',
              borderWidth: Random().nextDouble() * 7,
              borderColor:
                  Colors.primaries[Random().nextInt(Colors.primaries.length)],
              documents: data),
        );
      },
    )..onError(
        (error) {
          emit(
            PulpitState(
              inkColor: Colors.amber,
              isLoading: false,
              errorMessage: error.toString(),
              borderWidth: 1.0,
              borderColor: Colors.black,
              documents: const [],
            ),
          );
        },
      );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}

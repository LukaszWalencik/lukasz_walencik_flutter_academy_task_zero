import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'dart:math';
part 'pulpit_state.dart';

class PulpitCubit extends Cubit<PulpitState> {
  PulpitCubit()
      : super(PulpitState(
            inkColor: Colors.amber,
            isLoading: false,
            errorMessage: '',
            borderWidth: 1.0,
            borderColor: Colors.black,
            documents: []));

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      PulpitState(
        inkColor: Colors.amber,
        isLoading: true,
        errorMessage: '',
        borderWidth: 1.0,
        borderColor: Colors.black,
        documents: [],
      ),
    );

    _streamSubscription =
        FirebaseFirestore.instance.collection('data').snapshots().listen(
      (data) {
        emit(
          PulpitState(
              inkColor: Colors.amber,
              isLoading: false,
              errorMessage: '',
              borderWidth: 1.0,
              borderColor: Colors.black,
              documents: data.docs),
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
                  documents: [],
                ),
              );
            },
          );
  }

  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
  }

  Future<void> mixColors() async {
    _streamSubscription =
        FirebaseFirestore.instance.collection('data').snapshots().listen(
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
              documents: data.docs),
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
                  documents: [],
                ),
              );
            },
          );

    // emit(
    //   PulpitState(
    //     inkColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
    //     isLoading: false,
    //     errorMessage: '',
    //     borderWidth: Random().nextDouble() * 5,
    //     borderColor:
    //         Colors.primaries[Random().nextInt(Colors.primaries.length)],
    //     documents: [],
    //   ),
    // );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }

  // Future<void> mixColors2() async {
  //   emit(
  //     PulpitState(
  //       inkColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
  //       isLoading: false,
  //       errorMessage: '',
  //       borderWidth: Random().nextDouble() * 5,
  //       borderColor:
  //           Colors.primaries[Random().nextInt(Colors.primaries.length)],
  //       documents: [],
  //     ),
  //   );
  // }
}

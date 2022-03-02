import 'package:bloc/bloc.dart';
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
            borderColor: Colors.black));

  Future<void> mixColors() async {
    emit(PulpitState(
        inkColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        isLoading: false,
        errorMessage: '',
        borderWidth: Random().nextDouble() * 5,
        borderColor:
            Colors.primaries[Random().nextInt(Colors.primaries.length)]));
  }

  Future<void> mixColors2() async {
    emit(PulpitState(
        inkColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        isLoading: false,
        errorMessage: '',
        borderWidth: Random().nextDouble() * 5,
        borderColor:
            Colors.primaries[Random().nextInt(Colors.primaries.length)]));
  }
}

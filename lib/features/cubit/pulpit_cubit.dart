import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pulpit_state.dart';

class PulpitCubit extends Cubit<PulpitState> {
  PulpitCubit() : super(PulpitState());
}

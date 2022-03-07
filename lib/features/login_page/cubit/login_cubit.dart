import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lukasz_walencik_flutter_academy_task_zero/app/core/enums.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  void createAccount(bool creatingAccount) {
    switch (creatingAccount) {
      case false:
        emit(
          const LoginState(creatingAccount: true),
        );
        break;
      case true:
        emit(
          const LoginState(creatingAccount: false),
        );
        break;
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(const LoginState(status: Status.loading));
    } catch (error) {
      emit(LoginState(status: Status.error, errorMessage: error.toString()));
    }
  }

  Future<void> singIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(const LoginState(status: Status.loading));
    } catch (error) {
      emit(LoginState(status: Status.error, errorMessage: error.toString()));
    }
  }
}

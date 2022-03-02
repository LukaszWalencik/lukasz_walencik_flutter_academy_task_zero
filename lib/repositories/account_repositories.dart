import 'package:lukasz_walencik_flutter_academy_task_zero/data/firebase_data_source.dart';

class AccountRepository {
  AccountRepository(this._firebaseDataSource);

  final FirebaseDataSource _firebaseDataSource;

  Future<void> signOut() async {
    await _firebaseDataSource.signOut();
  }

  Future<void> signUp(String email, String password) async {
    await _firebaseDataSource.signUp(email, password);
  }

  Future<void> signIn(String email, String password) async {
    await _firebaseDataSource.singIn(email, password);
  }
}

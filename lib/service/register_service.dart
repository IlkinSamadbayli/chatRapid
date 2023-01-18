import 'package:firebase_auth/firebase_auth.dart';

class RegisterService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future registerUserwithEmailAndPassword(
      String email, String fullName, String password) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;
      if (user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media/service/database_service.dart';

class AuthService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future loginUserwithEmailAndPassword(String email, String password) async {
    try {
      User user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;
      if (user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future registerUserwithEmailAndPassword(
      String email, String fullName, String password) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;
      if (user != null) {
        await DataBaseService(uid: user.uid).savingUserData(email, fullName);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}

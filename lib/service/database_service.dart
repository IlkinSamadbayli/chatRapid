import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService {
  final String? uid;
  DataBaseService({this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference groupCollection =
      FirebaseFirestore.instance.collection('groups');

  Future updateUserData(String email, String fullName) async {
    return await userCollection.doc(uid).set({
      'fullName': fullName,
      'email': email,
      'profilePic': '',
      'groups': [],
      'uid': uid,
    });
  }
}

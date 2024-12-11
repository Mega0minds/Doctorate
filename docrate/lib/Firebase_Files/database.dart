import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future storeUserInfo(String path, String key, String malloc) async {
    return await _firestore.collection(path).doc(_auth.currentUser!.uid).set({
      key: malloc,
    });
  }
}

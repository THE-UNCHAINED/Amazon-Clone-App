import 'package:firebase_auth/firebase_auth.dart';
import '../modal/user_details_modal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirestoreClass {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future uploadNameandAddressToDatabase(
      {required UserDetailModal user}) async {
    await firebaseFirestore
        .collection("users")                   // Search the data of Users in collection
        .doc(firebaseAuth.currentUser!.uid)    // else create the user in the collection
        .set(
              user.getJson());         // collection in the form of json way});
  }
}

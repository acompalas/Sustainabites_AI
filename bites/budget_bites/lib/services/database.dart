import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ required this.uid });

  // collection reference
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('user');

  Future updateName(String firstname, String lastname) async {
    return await userCollection.doc(uid).set({
      'firstname': firstname,
      'lastname': lastname,
    });
  }
}
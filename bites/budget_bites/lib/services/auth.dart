import 'package:budget_bites/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in with email and password
  Future signIn(String email, String pass) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: pass
      );
      User? user = userCredential.user;
      print("Found user: ${user!.uid}");
      return user.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return false;
    }
  }

  // register with email and password
  Future registerWEP(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;

      // create a new document for the user with the uid
      await DatabaseService(uid: user!.uid).updateName("nullFirst", "nullLast");

      print("User registered: ${user.uid}");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
  

  Future<String?> getUID() async {
  // Get the current user from FirebaseAuth
  User? user = FirebaseAuth.instance.currentUser;

  // If the user is not null, return the UID
  if (user != null) {
    return user.uid;
  } else {
    // If no user is signed in, return null
    return "false";
  }
}

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    }
    catch(e) {
      print(e.toString());
      return null;
    }
  }
  
}
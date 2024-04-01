import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseAuth _auth;

  FirebaseService(this._auth);

  User? user;

  _authState() {
    _auth.authStateChanges().listen((event) {
      user = event;
    });
  }

  Future<User?> handleGoogleSignIn() async {
    try{

      final provider = GoogleAuthProvider();
       final data  = await _auth.signInWithProvider(provider);
      return data.user;
    } catch (error) {
      print(error);
      return null;
    }
  }

  signOut() {
    _auth.signOut();
  }

}
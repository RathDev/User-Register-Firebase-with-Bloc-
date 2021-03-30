import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;


  UserRepository() : _firebaseAuth = FirebaseAuth.instance;

  Future<void> signInWithCredentials(String email, String password) {
    print('User is SignIn With credential');

    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signUp(String email, String password) {
    print('User is SignUp');

    return _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() {
    print('User is SignOut');

    return Future.wait([_firebaseAuth.signOut()]);
  }

  Future<bool> isSignedIn() async {
    print('User isSignIn');
//    final currentUser = await _firebaseAuth.currentUser();
    final currentUser =  _firebaseAuth.currentUser;

    return currentUser != null;
  }

  Future<User> getUser() async {
    print ('User is get user');
   // return await _firebaseAuth.currentUser();
    return  _firebaseAuth.currentUser;

  }
}

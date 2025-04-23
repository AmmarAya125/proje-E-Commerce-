// ignore: depend_on_referenced_packages
import 'package:firebase_auth/firebase_auth.dart' as fb;
import '../models/user.dart';

class AuthService {
  final fb.FirebaseAuth _auth = fb.FirebaseAuth.instance;

  Future<User?> signIn(String email, String password) async {
    final result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    final fbUser = result.user;

    if (fbUser != null) {
      // Default role: client
      return User(
        uid: fbUser.uid,
        email: fbUser.email ?? '',
        role: UserRole.client,
      );
    }
    return null;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<User?> getCurrentUser() async {
    final fbUser = _auth.currentUser;
    if (fbUser != null) {
      return User(
        uid: fbUser.uid,
        email: fbUser.email ?? '',
        role: UserRole.client,
      );
    }
    return null;
  }
}

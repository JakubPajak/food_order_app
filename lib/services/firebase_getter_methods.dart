import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  String getUsername() {
    User? user = FirebaseAuth.instance.currentUser;
    return user?.displayName ?? '';
  }
}

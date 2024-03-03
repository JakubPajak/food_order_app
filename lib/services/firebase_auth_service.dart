import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_order_app/src/presentation/pages/home_page.dart';
import 'package:food_order_app/theme/font_styles/poppins_styles.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// ---------------- Sign Up methods ------------------
  ///
  ///Sing Up With email and password
  ///
  ///
  Future<User?> signUpWithEmailAndPassword(String email, String password,
      String username, BuildContext context) async {
    try {
      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      await userCredential.user!.updateDisplayName(username);

      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Signed Up sucessfully!')));

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.yellow,
              content: Text(
                'Sign-up failed. The provided email is already is use - log in',
                style: PoppinsStyles().boldPoppins(),
              ),
            ),
          );
          break;
        case 'weak-password':
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                'Sign-up failed. The provided password is to weak.',
                style: PoppinsStyles().boldPoppins(),
              ),
            ),
          );
          break;
        default:
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                'Sign-up failed. Please try again. $e',
              )));
          break;
      }
    }
    return null;
  }

  /// ---------------- Sign In methods ------------------
  ///
  ///  Sign In via email address and password
  Future<User?> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.green,
          content: Text('Logged In sucessfully!')));

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red, content: Text('Log In failed! $e')));
    }
    return null;
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthResetPass {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> sendPasswordResetEmail(
      String email, BuildContext context) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Password reset email sent. Please check your email inbox.')),
      );
    } catch (e) {
      // An error occurred while sending the email, handle the error
      print('Failed to send password reset email: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Failed to send password reset email. Please try again later.')),
      );
    }
  }
}

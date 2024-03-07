import 'package:flutter/material.dart';
import 'package:food_order_app/services/firebase_auth_reset_pass.dart';
import 'package:food_order_app/theme/font_styles/anta_styles.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reset',
          style: AntStyler().headingStyle(),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            child: Text(
              "Enter the email address to which the reset link will be sent",
              style: AntStyler().h2Style(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Email'),
                prefixIcon: Icon(Icons.email),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () async {
              FirebaseAuthResetPass()
                  .sendPasswordResetEmail(_emailController.text, context);
            },
            child: Text(
              'Send email',
              style: AntStyler().h2Style(),
            ),
            style: ButtonStyle(
              elevation: MaterialStateProperty.all<double>(5),
              minimumSize: MaterialStateProperty.all<Size>(const Size(200, 60)),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}

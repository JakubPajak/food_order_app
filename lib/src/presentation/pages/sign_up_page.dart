import 'package:flutter/material.dart';
import 'package:food_order_app/services/firebase_auth_service.dart';
import 'package:food_order_app/theme/font_styles/anta_styles.dart';
import 'package:food_order_app/theme/font_styles/poppins_styles.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late bool isVisible;
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _usernameController = new TextEditingController();

  @override
  void initState() {
    isVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: AntStyler().headingStyle(),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width - 50,
          child: Column(
            children: [
              SizedBox(
                height: 70,
              ),
              Text(
                'Log In to start',
                style: AntStyler().h1Style(),
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Username'),
                  prefixIcon: Icon(Icons.person_2),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Email'),
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Password'),
                    prefixIcon: Icon(Icons.password_outlined),
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        child: Icon(Icons.remove_red_eye_outlined))),
                obscureText: isVisible,
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () async {
                  await FirebaseAuthService().signUpWithEmailAndPassword(
                      _emailController.text,
                      _passwordController.text,
                      _usernameController.text,
                      context);
                },
                child: Text(
                  'Sign Up',
                  style: AntStyler().h2Style(),
                ),
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(5),
                  minimumSize: MaterialStateProperty.all<Size>(Size(200, 60)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text(
                  'Already habe an account? Sign In!',
                  style: PoppinsStyles().regularText(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Other possible sign up methods',
                style: AntStyler().h2Style(),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width - 100,
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle, border: Border.all()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.login_outlined),
                    Text(
                      'Sign up via Google Account',
                      style: PoppinsStyles().regularText(),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width - 100,
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle, border: Border.all()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.login_outlined),
                    Text(
                      'Sign up via Facebook',
                      style: PoppinsStyles().regularText(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

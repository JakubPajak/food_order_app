import 'package:flutter/material.dart';
import 'package:food_order_app/theme/font_styles/anta_styles.dart';
import 'package:food_order_app/theme/font_styles/poppins_styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late bool isVisible;

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
                height: 50,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Email'),
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
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
                onPressed: () {},
                child: Text(
                  'Log In',
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
                  Navigator.pushNamed(context, '/signup');
                },
                child: Text(
                  'Don\'t have an account yet? Sign Up!',
                  style: PoppinsStyles().regularText(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Other possible login methods',
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
                      'Login via Google Account',
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
                      'Login via Facebook',
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

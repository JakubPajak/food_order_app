import 'package:flutter/material.dart';
import 'package:food_order_app/theme/font_styles/poppins_styles.dart';

class CurrentOrderSubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.9,
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Close',
                    style: PoppinsStyles().regularText(),
                  ),
                ),
              ),
            ),
            ExpansionTile(
              title: Text(
                'How do I create an account?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'To create an account, tap on the Sign Up button and follow the instructions.',
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text('How do I create an account?'),
              subtitle: Text(
                  'To create an account, tap on the Sign Up button and follow the instructions.'),
            ),
            ListTile(
              title: Text('How do I reset my password?'),
              subtitle: Text(
                  'To reset your password, tap on the Forgot Password link on the login screen.'),
            ),
            Divider(),
            Text(
              'Contact Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              title: Text('Email'),
              subtitle: Text('support@example.com'),
            ),
            ListTile(
              title: Text('Phone'),
              subtitle: Text('+1 123-456-7890'),
            ),
            Divider(),
            Text(
              'Troubleshooting Tips',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              title: Text('App Crashes'),
              subtitle: Text(
                  'If the app crashes unexpectedly, try restarting your device and reinstalling the app.'),
            ),
            ListTile(
              title: Text('Network Issues'),
              subtitle: Text(
                  'If you encounter network issues, ensure that you have a stable internet connection.'),
            ),
            Divider(),
            Text(
              'Feedback',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              title: Text('Provide Feedback'),
              subtitle: Text(
                  'We value your feedback! Please send us your suggestions or report any issues you encounter.'),
            ),
          ],
        ),
      ),
    );
  }
}

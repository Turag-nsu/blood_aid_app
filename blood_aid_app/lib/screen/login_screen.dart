import 'package:blood_aid_app/screen/navbar.dart';
import 'package:blood_aid_app/screen/reset_paasword.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _hidePassword = true;

  Future<void> _resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      print('Password reset email sent');
    } catch (e) {
      print('Error sending password reset email: $e');
      // Handle error here
    }
  }

  void _login() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Both email and password are required.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const navbar()));
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text('Failed to log in: ${e.message}'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blood Aid'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: [
          Image.asset(
            'images/logo.png',
            height: MediaQuery.of(context).size.height * .25,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              "Welcome To Blood Aid",
              style: TextStyle(
                  fontSize: 35, fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 80.0, top: 20, bottom: 20),
            child: Text(
              "Please log in to your account ",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email address',
                hintText: 'Enter your email address',
                prefixIcon: const Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                prefixIcon: const Icon(Icons.lock_outlined),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _hidePassword = !_hidePassword;
                    });
                  },
                  icon: Icon(
                      _hidePassword ? Icons.visibility_off : Icons.visibility),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              obscureText: _hidePassword,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
            child: ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(primary: Colors.red),
              child: const Text('Log In'),
            ),
          ),
          TextButton(
            child: const Text('Forgot Password'),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ResetPasswordScreen()));
            },
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'New user?',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.red,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Signup()),
                      );
                    },
                    child: const Text('Register here'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

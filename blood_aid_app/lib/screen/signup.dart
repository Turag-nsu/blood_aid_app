import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'blood_donation_screen.dart';
import 'login_screen.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String email = '';
    String pass = '';

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
            height: MediaQuery.of(context).size.height * .15,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (value) {
                email = value;
              },
              decoration: InputDecoration(
                hintText: 'Email address',
                prefixIcon: Icon(Icons.person_2_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (value) {
                pass = value;
              },
              obscureText: true, // Hides the password text
              decoration: InputDecoration(
                hintText: 'Enter your password',
                prefixIcon: Icon(Icons.lock_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 10),
            child: ElevatedButton(
              onPressed: () async {
                try {
                  UserCredential userCredential = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: email,
                    password: pass,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const blooddonation(),
                    ),
                  );
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak password') {
                    print('weak password');
                  } else if (e.code == 'email already in use') {
                    print('the account already exists');
                  }
                } catch (e) {
                  print(e);
                }
              },
              child: const Text('Register'),
              style: ElevatedButton.styleFrom(primary: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}

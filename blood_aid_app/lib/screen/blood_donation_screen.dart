import 'package:blood_aid_app/screen/Profile.dart';
import 'package:blood_aid_app/screen/aboutus.dart';
import 'package:blood_aid_app/screen/blood_request_details.dart';
import 'package:blood_aid_app/screen/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class blooddonation extends StatefulWidget {
  const blooddonation({super.key});
  @override
  State<blooddonation> createState() => _blooddonationState();
}

// ignore: camel_case_types
class _blooddonationState extends State<blooddonation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blood Donation'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text(
                'Menu',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            ListTile(
              title: const Text(
                'My profile',
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
            ),
            ListTile(
              title: const Text(
                'Log Out',
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
            ),
            ListTile(
              title: const Text(
                'About us',
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutUsPage()));
              },
            ),
          ],
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('request').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var documents = snapshot.data!.docs;

            return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (context, index) {
                var documentData =
                    documents[index].data() as Map<String, dynamic>;
                var name = documentData['name'] as String?;
                var number = documentData['number'] as String?;
                var group = documentData['group'] as String?;
                var date = documentData['date'] as String?;
                var center = documentData['center'] as String?;
                var notes = documentData['notes'] as String?;

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => requestdetails(
                          name: name ?? '',
                          number: number ?? '',
                          group: group ?? '',
                          date: date ?? '',
                          center: center ?? '',
                          notes: notes ?? '',
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text('Name: ${name ?? ''}'),
                    subtitle: Text('Number: ${number ?? ''}'),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }
}

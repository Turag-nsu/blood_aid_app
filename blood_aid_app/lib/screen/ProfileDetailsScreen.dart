import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 202, 13, 0),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('profile').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            final profileData = snapshot.data!.docs;
            return ListView.builder(
              itemCount: profileData.length,
              itemBuilder: (BuildContext context, int index) {
                final data = profileData[index].data() as Map<String, dynamic>;
                return ListTile(
                  title: Text('Name: ${data['name']}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Blood Group: ${data['group']}'),
                      Text('Contact Number: ${data['num']}'),
                      Text('Email: ${data['mail']}'),
                      Text('Area: ${data['area']}'),
                      Text('Date of Birth: ${data['birth']}'),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

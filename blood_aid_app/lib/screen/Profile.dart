import 'package:blood_aid_app/screen/ProfileDetailsScreen.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool editMode = false;
  TextEditingController name = TextEditingController();
  TextEditingController group = TextEditingController();
  TextEditingController num = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController birth = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blood Aid'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 202, 13, 0),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              setState(() {
                editMode = !editMode;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 102, 101, 101),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(5 * 5),
                bottomLeft: Radius.circular(5 * 5),
              ),
            ),
            child: Row(
              children: const [
                CircleAvatar(
                  maxRadius: 50,
                  minRadius: 50,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('images/5907.jpg'),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, bottom: 70),
                  child: Text(
                    "Name Name",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "myname@mail.com",
                    style: TextStyle(fontSize: 15),
                    selectionColor: Color.fromARGB(255, 251, 248, 248),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: TextField(
              controller: name,
              decoration: InputDecoration(
                hintText: 'Name',
                prefixIcon: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: TextField(
              controller: group,
              decoration: InputDecoration(
                hintText: 'Blood Group',
                prefixIcon: Icon(Icons.circle),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: TextField(
              controller: num,
              decoration: InputDecoration(
                hintText: 'Contact Number',
                prefixIcon: Icon(Icons.call),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: TextField(
              controller: mail,
              decoration: InputDecoration(
                hintText: 'Email',
                prefixIcon: Icon(Icons.mail),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: TextField(
              controller: area,
              decoration: InputDecoration(
                hintText: 'Area',
                prefixIcon: Icon(Icons.home),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: TextField(
              controller: birth,
              decoration: InputDecoration(
                hintText: 'Date Of Birth',
                prefixIcon: Icon(Icons.date_range_outlined),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 228, 19, 4),
              ),
              onPressed: () {
                Map<String, dynamic> data = {
                  "name": name.text,
                  "group": group.text,
                  "num": num.text,
                  "mail": mail.text,
                  "area": area.text,
                  "birth": birth.text
                };

                name.clear();
                num.clear();
                group.clear();
                birth.clear();
                mail.clear();
                area.clear();

                FirebaseFirestore.instance.collection("profile").add(data);
              },
              child: const Text("Update profile"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileDetailsScreen(),
                  ),
                );
              },
              child: const Text("Profile"),
            ),
          ),
        ],
      ),
    );
  }
}

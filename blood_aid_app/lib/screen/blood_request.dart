import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: camel_case_types
class blood_requests extends StatefulWidget {
  blood_requests({super.key});

  @override
  State<blood_requests> createState() => _blood_requestsState();
}

class _blood_requestsState extends State<blood_requests> {
  get phoneNumberController => null;

  TextEditingController name = new TextEditingController();
  TextEditingController number = new TextEditingController();
  TextEditingController date = new TextEditingController();
  TextEditingController center = new TextEditingController();
  TextEditingController notes = new TextEditingController();
  TextEditingController group = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submit Blood Request'),
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
              controller: name,
              decoration: InputDecoration(
                hintText: 'Patients Name',
                prefixIcon: const Icon(Icons.person_2_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: number,
              keyboardType: const TextInputType.numberWithOptions(),
              validator: (value) {
                if (value!.isEmpty || value.length != 11) {
                  return 'Provide 11 Digit Number';
                }
                return null;
              },
              decoration: InputDecoration(
                  hintText: "Phone Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  )),
            ),
          ),
          TextField(
            controller: group,
            decoration: InputDecoration(
              hintText: 'Blood Group',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: date,
              decoration: InputDecoration(
                hintText: 'Request Date',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: center,
              decoration: InputDecoration(
                hintText: 'Medical Center',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: notes,
              decoration: InputDecoration(
                hintText: 'Notes (Optional)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                Map<String, dynamic> data = {
                  "name": name.text,
                  "number": number.text,
                  "group": group.text,
                  "date": date.text,
                  "center": center.text,
                  "notes": notes.text
                };

                name.clear();
                number.clear();
                group.clear();
                date.clear();
                center.clear();
                notes.clear();

                FirebaseFirestore.instance.collection("request").add(data);
              },
              child: const Text('Submit'),
              style: ElevatedButton.styleFrom(primary: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}

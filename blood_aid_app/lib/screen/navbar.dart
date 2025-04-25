import 'package:blood_aid_app/screen/Profile.dart';
import 'package:blood_aid_app/screen/aboutus.dart';
import 'package:flutter/material.dart';
import 'blood_donation_screen.dart';
import 'blood_request.dart';

class navbar extends StatefulWidget {
  const navbar({Key? key}) : super(key: key);

  @override
  State<navbar> createState() => _navbarState();
}

class _navbarState extends State<navbar> {
  var _pages = [
    blooddonation(),
    blood_requests(),
  ];
  int _selecteditem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selecteditem],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.red,
        selectedItemColor: Colors.white,
        selectedFontSize: 20,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add),
            label: 'Post',
          ),
        ],
        currentIndex: _selecteditem,
        onTap: (setValue) {
          setState(() {
            _selecteditem = setValue;
          });
        },
      ),
    );
  }
}

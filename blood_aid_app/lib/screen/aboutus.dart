import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to Blood Aid',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'At Blood Aid, we are dedicated to saving lives through blood donations. Our mission is to connect donors with those in need and ensure a safe and reliable blood supply.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'How It Works',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '1. Register as a donor on our platform.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '2. Find nearby blood donation events and centers.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '3. Donate blood and save lives!',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'For any inquiries or support, please feel free to reach out to us at:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              'Email: bloodaid@gmail.com',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              'Phone: +880123456789',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

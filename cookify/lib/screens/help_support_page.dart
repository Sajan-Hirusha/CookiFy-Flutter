import 'package:flutter/material.dart';

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help & Support'),
        backgroundColor: Color(0xFF0C3732),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'How can we help you?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0C3732),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'If you have any questions, concerns, or feedback, feel free to reach out to us. Our team is here to assist you with any issues you may encounter.',
              style: TextStyle(fontSize: 16, color: Colors.grey[800], height: 1.5),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Icon(Icons.email, color: Color(0xFF0C3732)),
                SizedBox(width: 10),
                Text(
                  'Email: support@cookify.com',
                  style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.phone, color: Color(0xFF0C3732)),
                SizedBox(width: 10),
                Text(
                  'Phone: +1 (123) 456-7890',
                  style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                ),
              ],
            ),
            SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0C3732),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onPressed: () {
                // Go back to the previous page
                Navigator.pop(context);
              },
              child: Text(
                'Go Back',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:cookify/screens/ContactRow.dart';
import 'package:flutter/material.dart';

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Help & Support',
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        backgroundColor: Color(0xFF0C3732),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Expanded( // Ensures content takes available space but allows scrolling
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Image
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/helpImage.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
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

                        // Contact details using ContactRow widget
                        ContactRow(
                          icon: Icons.email,
                          text: 'Email: support@cookify.com',
                        ),
                        SizedBox(height: 20),
                        ContactRow(
                          icon: Icons.phone,
                          text: 'Phone: +1 (123) 456-7890',
                        ),
                        SizedBox(height: 20),
                        ContactRow(
                          icon: Icons.location_on,
                          text: 'Address: 123 Cookify St, Food City, FC 98765',
                        ),
                        SizedBox(height: 20),
                        ContactRow(
                          icon: Icons.web,
                          text: 'Website: www.cookify.com',
                        ),
                        SizedBox(height: 40),

                        // Go Back Button
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF0C3732),
                              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Go Back',
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Footer Section (Remains at Bottom)
          Container(
            width: double.infinity,
            color: Color(0xFF0C3732),
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: Text(
                '© 2025 Cookify. All Rights Reserved.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

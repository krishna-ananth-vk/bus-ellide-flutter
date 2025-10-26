import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  // The rest of your ProfileScreen class remains the same...

  void _showPrivacyPolicy(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return SizedBox(
          height: 500,
          child: ListView(
            padding: const EdgeInsets.all(16.0), // Apply padding here
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 32.0),
                height: 500,
                child: MarkdownWidget(
                  data: """
# Privacy Policy

Welcome to our app! Here’s how we handle your data:

- We respect your privacy.
- We do not sell your data to third parties.
- We do not store your data.
- Your location data is used only for providing bus tracking services.

For more details, contact krishnaananthvk@gmail.com.
              """,
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  // The rest of your ProfileScreen class remains the same...
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: const [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                          'https://via.placeholder.com/150',
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        'Hi there!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    'Track buses in real time, find nearby stops, and plan your journey easily.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => _showPrivacyPolicy(context),
                    child: const Text(
                      'Privacy Policy',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Version 0.1 alpha',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

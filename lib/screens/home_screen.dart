import 'package:flutter/material.dart';
import 'login_screen.dart';
import '../utils/utils.dart'; // Import helper functions

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Flutter App"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // FutureBuilder to simulate data fetching
            FutureBuilder<String>(
              future: fetchWelcomeMessage(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(); // Show loading
                } else if (snapshot.hasError) {
                  return const Text("Error loading message");
                } else {
                  return Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      snapshot.data ?? "Welcome!",
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 20),

            // FutureBuilder for Network Image
            FutureBuilder<String>(
              future: fetchImageUrl(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return const Icon(Icons.error, size: 100, color: Colors.grey);
                } else {
                  return Image.network(
                    snapshot.data!,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  );
                }
              },
            ),
            const SizedBox(height: 20),

            // Interactive Button
            ElevatedButton(
              onPressed: () => print("Button Clicked!"),
              child: const Text("Click Me"),
            ),

            const SizedBox(height: 30),

            // Navigation Button to Login Screen
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: const Text("Go to Login"),
            ),
          ],
        ),
      ),
    );
  }
}

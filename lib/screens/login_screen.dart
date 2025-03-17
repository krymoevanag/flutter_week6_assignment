import 'package:flutter/material.dart';
import '../utils/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin() {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    bool isLoggedIn = AuthService.login(username, password);
    if (isLoggedIn) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login Successful!")),
      );
      // Navigate to HomeScreen or Dashboard
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid Credentials! Try again.")),
      );
    }
  }

  void _handleRegister() {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    bool isRegistered = AuthService.register(username, password);
    if (isRegistered) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Registration Successful! You can now log in.")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Username already exists! Try another.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Username Input
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            // Password Input
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Row with Login and Register Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _handleLogin,
                  child: const Text("Login"),
                ),
                ElevatedButton(
                  onPressed: _handleRegister,
                  child: const Text("Register"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

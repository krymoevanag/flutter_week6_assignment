import 'dart:async';

// Simulate fetching a welcome message from an API
Future<String> fetchWelcomeMessage() async {
  await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
  return "Welcome to My Flutter App!";
}

// Simulate fetching an image URL
Future<String> fetchImageUrl() async {
  await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
  return "https://picsum.photos/200"; // Valid image URL
}

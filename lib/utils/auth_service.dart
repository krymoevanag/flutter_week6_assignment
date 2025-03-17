class AuthService {
  static final Map<String, String> _users = {}; // Simulating a database

  static bool register(String username, String password) {
    if (_users.containsKey(username)) {
      return false; // Username already exists
    }
    _users[username] = password;
    return true; // Registration successful
  }

  static bool login(String username, String password) {
    return _users[username] == password; // Check credentials
  }
}

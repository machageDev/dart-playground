
// TODO Implement this library.

class AuthRepository {
  // simulate API login
  Future<bool> login(String username, String password) async {
    // simulate network delay
    await Future.delayed(const Duration(seconds: 2));
    // simple logic for demo purposes
    if (username == 'user' && password == 'password') {
      return true;
    } else {
      return false;
    }
  }
 
  // Simulate API login
  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    return email == 'admin@gmail.com' && password == '123456';
  }

  // Simulate API registration
  Future<bool> register(String name, String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));

    // For now, let's accept any non-empty input as successful registration
    if (name.isNotEmpty && email.isNotEmpty && password.length >= 6) {
      return true;
    }
    return false;
  }
}


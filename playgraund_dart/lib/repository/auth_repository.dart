
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
 


  // Simulate API registration
  Future<bool> register(String name, String email, String password ) async {
    await Future.delayed(const Duration(seconds: 2));

    // For now, let's accept any non-empty input as successful registration
    if (name.isNotEmpty && email.isNotEmpty && password.length >= 6) {
      return true;
    }
    return false;
  }
    Future<void> forgotPassword(String email) async {
    // Simulate API call delay
    await Future.delayed(Duration(seconds: 2));

    // Simulate success or failure
    if (email == "fail@test.com") {
      throw Exception("Email not found");
    }
  }
}


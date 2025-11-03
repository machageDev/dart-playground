
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
}
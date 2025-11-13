class User {
  final int id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  // Factory constructor — converts JSON → User object
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }

  // Optional: Convert User → JSON (useful when posting data)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}

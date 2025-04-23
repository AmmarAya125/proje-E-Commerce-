enum UserRole { client, admin }

class User {
  final String uid;
  final String email;
  final String? name;
  final UserRole role;

  User({
    required this.uid,
    required this.email,
    this.name,
    required this.role,
  });
}

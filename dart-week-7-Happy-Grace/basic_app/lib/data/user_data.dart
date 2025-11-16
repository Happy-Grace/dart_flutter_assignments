class AppUser {
  final String fullName;
  final String email;
  final String password;

  AppUser({
    required this.fullName,
    required this.email,
    required this.password,
  });
}

// Global list of registered users
List<AppUser> registeredUsers = [];


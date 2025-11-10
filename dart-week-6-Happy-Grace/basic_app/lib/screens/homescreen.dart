import 'package:flutter/material.dart';
import 'register.dart';

// Home Screen (Welcome + Login Layout)
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Controllers
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Error messages
  String? _usernameError;
  String? _passwordError;

  // Simulated user storage
  final Map<String, String> _registeredUsers = {};

  // Password regex: min 6 chars, 1 uppercase, 1 lowercase, 1 digit, 1 special char
  final RegExp _passwordRegex =
      RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$');

  // Login function
  void _login() {
    setState(() {
      _usernameError = null;
      _passwordError = null;

      final username = _usernameController.text.trim();
      final password = _passwordController.text;

      // Username validation
      if (username.isEmpty) {
        _usernameError = "Username is required";
      } else if (!_registeredUsers.containsKey(username)) {
        _usernameError = "Username not found. Please register first";
      }

      // Password validation
      if (password.isEmpty) {
        _passwordError = "Password is required";
      } else if (_registeredUsers.containsKey(username) &&
          _registeredUsers[username] != password) {
        _passwordError = "Incorrect password";
      } else if (password.isNotEmpty && !_passwordRegex.hasMatch(password)) {
        _passwordError =
            "Password must be 8+ chars, include uppercase, lowercase, digit, special char";
      }

      // Successful login
      if (_usernameError == null && _passwordError == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login successful! Welcome $username")),
        );
      }
    });
  }

  // Register new user
  void _registerUser(String username, String password) {
    _registeredUsers[username] = password;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'A Basic Flutter App',
          style: TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w900,
            fontSize: 28,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Welcome message
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.blueGrey, width: 3),
              ),
              child: const Center(
                child: Text(
                  'Welcome to this Basic Flutter UI App',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.italic,
                    color: Colors.lightBlueAccent,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            const SizedBox(height: 35),

            // Image
            Image.network(
              "https://images.unsplash.com/photo-1762656668994-57d8933d59dd?ixlib=rb-4.1.0&auto=format&fit=crop&q=80&w=387",
              height: 200,
            ),

            const SizedBox(height: 20),
            const Divider(thickness: 3),
            const SizedBox(height: 15),

            // LOGIN AREA
            Center(
              child: SizedBox(
                width: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Username Field
                    Align(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Username",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Euphoria Script',
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 7),
                    SizedBox(
                      height: 60,
                      child: TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          hintText: "Enter your username",
                          prefixIcon: const Icon(Icons.person),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                                color: Colors.lightBlue, width: 1.2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                                color: Colors.blueAccent, width: 1.6),
                          ),
                          errorText: _usernameError,
                          helperText: " ",
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),

                    // Password Field
                    Align(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Password",
                        style: TextStyle(
                          fontFamily: "Euphoria Script",
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 7),
                    SizedBox(
                      height: 60,
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          hintText: "Enter your password",
                          prefixIcon: const Icon(Icons.lock),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: Colors.blueGrey, width: 1.2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: Colors.blue, width: 1.8),
                          ),
                          errorText: _passwordError,
                          helperText: " ",
                        ),
                      ),
                    ),
                    const SizedBox(height: 35),

                    // Login + Register Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Login button
                        ElevatedButton(
                          onPressed: _login,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black87,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                          ),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                        ),

                        // Register button
                        OutlinedButton(
                          onPressed: () async {
                            // Navigate to register page and wait for result
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterPage()),
                            );

                            if (result != null && result is Map<String, String>) {
                              _registerUser(
                                  result['username']!, result['password']!);

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      "User ${result['username']} registered successfully!"),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black87,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                          ),
                          child: const Text(
                            "Register",
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




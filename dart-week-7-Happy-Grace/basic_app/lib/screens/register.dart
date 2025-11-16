import 'package:flutter/material.dart';
import 'package:basic_app/data/user_data.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // Regex patterns
  final String emailPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  final String passwordPattern =
      r'^(?=.*[A-Za-z])(?=.*\d).{8,}$'; // min 8 chars, at least 1 letter and 1 number

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Responsive width
    double fieldWidth = MediaQuery.of(context).size.width * 0.85;
    if (fieldWidth > 400) fieldWidth = 400; // max width

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Register',
          style: TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w900,
            fontSize: 28,
            color: Colors.indigo,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Create a New Account',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 52, 68, 156),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),

                // Full Name
                SizedBox(
                  width: fieldWidth,
                  child: TextFormField(
                    controller: _fullNameController,
                    decoration: InputDecoration(
                      hintText: 'Full Name',
                      prefixIcon: const Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),

                // Email
                SizedBox(
                  width: fieldWidth,
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Email Address',
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(emailPattern).hasMatch(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),

                // Password
                SizedBox(
                  width: fieldWidth,
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (!RegExp(passwordPattern).hasMatch(value)) {
                        return 'Password must be at least 8 chars and include a number';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),

                // Confirm Password
                SizedBox(
                  width: fieldWidth,
                  child: TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      prefixIcon: const Icon(Icons.lock_outline),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 30),

                // Register Button
                SizedBox(
                  width: fieldWidth,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        String email =
                            _emailController.text.trim().toLowerCase();

                        // Check if email already exists
                        bool emailExists = registeredUsers.any(
                          (user) => user.email.toLowerCase() == email,
                        );

                        if (emailExists) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  "This email is already registered!"),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return; // stop registration
                        }

                        // Save new user
                        registeredUsers.add(
                          AppUser(
                            fullName: _fullNameController.text.trim(),
                            email: email,
                            password: _passwordController.text.trim(),
                          ),
                        );

                        // Return credentials to login page
                        Navigator.pop(context, {
                          'username': email,
                          'password': _passwordController.text.trim(),
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Registration successful!')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

// Main entry point of flutter app
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,    
      title: 'Welcome App', // App title
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold (Appbar + body)
    return Scaffold(
      backgroundColor: Colors.lightBlue[50], // body background colour
      appBar: AppBar(
        title: const Text(
          'My Simple App', 
          style: TextStyle(
            color: Colors.white, // title font color
            fontSize: 23,
            fontWeight: FontWeight.w800,            
            fontFamily: 'Allura',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Centers the column vertically
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Welcome to My Simple Flutter App!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Great Vibes',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20), // Spacing
              ElevatedButton(
                onPressed: () {
                  print('Button Clicked!');
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent, // Button background
                  padding: EdgeInsets.symmetric(
                    horizontal: 26,
                    vertical: 14,
                  ), // Button padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Rounded edges
                  ),
                ),
                child: Text(
                  'Click Me',
                  style: TextStyle(
                    color: Colors.white, // White font for visibility
                    fontSize: 16, // Readable text size
                    fontWeight: FontWeight.bold, // Bold button text
                  ),
                ),
              ),
              const SizedBox(height: 30), // Spacing
              Image.network(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                height: 180,
                width: 180,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/**
 *  Write a function convertAndDisplay that: 
 * Takes a String representing a number. Converts the String to int and double. Prints the results.
 * 
 * Implement convertAndDisplay(String number) to:
 * Convert the input to int and double.
 * Print both values.
 */

import 'dart:io';

// Function for conversion [String -> int and String -> double]
void convertAndDisplay(String number) {
  try {
    // Convert to int
    int myInt = int.parse(number);
    print('Converted to int: $myInt');
  } catch (e) {
    print('Cannot convert "$number" to int: $e');
  }

  try {
    // Convert to double
    double myDouble = double.parse(number);
    print('Converted to double: $myDouble');
  } catch (e) {
    print('Cannot convert "$number" to double: $e');
  }
}

void main() {
  // Read input from users and convert
  stdout.write("Enter a number for conversion(e.g: 12345): ");
  String? input = stdin.readLineSync();

  if (input != null && input.isNotEmpty) {
    convertAndDisplay(input);
  } else {
    print("No input was provided!.");
  }
}

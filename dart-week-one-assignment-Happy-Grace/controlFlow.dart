import 'dart:io';

/**
 * Control Flow: 
 * A. If-Else:
 *    Check if a number is positive, negative, or zero.
 *    Verify voting eligibility (18+).
 * 
 * B. Switch Case:
 *    Print the day of the week based on an integer (1-7).
 * 
 * C. Loops:
 *    for loop: Print 1 to 10.
 *    while loop: Print 10 to 1.
 *    do-while loop: Print 1 to 5.
 * 
 */

void main() {
  // A.  If...Else Staement:   

  // 1. ---------- Checks if a number is positive, negative or zero. ----------
  try {
    stdout.write("Please enter a number: ");
    double num = double.parse(stdin.readLineSync()!);

  
    if (num > 0) {
      print("\nThe number entered is positive.\n");
    } else if (num < 0) {
      print("\nThe number entered is negative.\n");
    } else {
      print("\nThe number entered is zero.\n");
    }

  } catch (e) {
    print("\nThe value entered is an Invalid Input.\nPlease enter a valid input.\n");
  } 

  // 2. ---------- Verify voting eligibility (18+) ----------
  try {
    stdout.write("Please enter your name: ");
    String? name = stdin.readLineSync();
    // print("\n");

    stdout.write("\nPlease enter your age(e.g: 20): ");
    int age = int.parse(stdin.readLineSync()!);
    // print("\n");

    
    if (age >= 18) {
      print("${name} of the age: ${age} yrs old, is eligible for voting.\n");
    } else if (age < 0) {
      print("${name}! Your age: ${age} cannot be of a negative value. Take note!\n");
    } else {
      print("${name} of the age: ${age} yrs old, is not eligible for voting.\n");
    }

  } catch (e) {
    print("An invalid input. Please enter a valid age.\n");
  }


  // B. ---------- Switch Case: Print the day of the week based on an integer (1-7). ----------

  try {
    stdout.write("Please enter a number between 1-7 (e.g: 5): ");
    int day = int.parse(stdin.readLineSync()!);

    // Check and display the day of the week.
    switch (day) {
      case 1: 
        print("Monday\n");
        break;
      
      case 2: 
        print("Tuesday\n");
        break;
      
      case 3: 
        print("Wednesday\n");
        break;
      
      case 4:
        print("Thursday\n");
        break;
      
      case 5:
        print("Friday\n");
        break;
      
      case 6:
        print("Saturday\n");
        break;
      
      case 7: 
        print("Sunday\n");
        break;

      default:
        print("Invalid day number!\n");
    }
  } catch (e) {
    print("Invalid input! Please enter a number between 1 and 7.\n");
  }


  // C. Loops:

  // 1. ---------- For Loop: Print 1 to 10 ----------
  print("For Loop: Print the numbers from 1 to 10.\n");
  for (int i = 1; i <= 10; i++) {
    print("Number ${i}");
  }
  print("\nThe end!\n");

  // 2. ---------- While Loop: Print 10 to 1 ----------
  print("While Loop: Printing the numbers from 10 to 1.\n");

  int a = 10;
  while(a > 0) {
    print("Number ${a}");
    a--;
  }
  print("\nThe end!\n");


  // 3. ---------- Do-While Loop: Print 1 to 5 based on user input ---------- 
  try {
    stdout.write("Do-While Loop: Press y to start printing form 1 to 5: ");
    String? inp = stdin.readLineSync();

    if (inp?.toLowerCase() == "y") {
      int b = 1;
      do {
        print("Number ${b}");
        b++;
      } while (b <= 5);
    } else {
      print("Do...While Loop skipped by user.\n");
    }
    print("\nThe end!\n");

  } catch (e) {
    print("Error occurred while reading the input!.\n");
  }

  


}
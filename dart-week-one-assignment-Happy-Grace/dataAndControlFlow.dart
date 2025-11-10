/**
 * Combine Data & Control Flow: 
 *    Iterate a List<int>, print each number.
 *    Check if even or odd.
 *    Use switch to categorize numbers as small (1-10), medium (11-100), or large (101+).
 */

void main() {
  // Defining a list of integers.
  List<int> nuumbers = [10, 2, -20, 289, 0, 12, 1, 28, 9, 29, 90, -29, -192, -18, 2901, ];

  // Iterate through the list of number
  for (int i = 0; i < nuumbers.length; i++) {
    int num = nuumbers[i];
    print("--> Item: ${i + 1}");
    print("--> Number: ${num}");

    // Check if the number is positive, negative or zero.
    if (num != 0 && num % 2 == 0) {
      print("--> The number: ${num} is EVEN.");

    } else if (num % 2 != 0) {
      print("--> The number: ${num} is ODD.");

    } else {
      print("--> The number is ZERO.");
    }

    // Switch...Case Statement to Categorize the numbers.
    
    switch (num) {
      case < 0:
        print('--> Category: NEGATIVE');
        break;
        
      case 0:
        print('--> Category: ZERO');
        break;

      case >= 1 && <= 10:
        print('--> Category: SMALL (1-10)');
        break;

      case >= 11 && <= 100:
        print('--> Category: MEDIUM (11-100)');
        break;

      case > 100:
        print('--> Category: LARGE (101+)');
        break;
    }

    print("");

  }


}
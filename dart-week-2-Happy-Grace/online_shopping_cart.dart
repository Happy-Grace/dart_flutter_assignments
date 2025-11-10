import "dart:io";
/**
 * ONLINE SHOPPING CART ASSIGNMENT!!
 * This Dart program simulates an online shopping cart with discounts and tax calculations using: 
 * anonymous, higher-order, and recursive functions.
 * 
 * Steps:
 * Filter Items: Remove items below $10 using an anonymous function.
 * Apply Discount: Use a higher-order function to reduce prices by a percentage.
 * Calculate Total: Compute the final price with an optional tax.
 * Factorial Discount: Apply an extra discount based on the factorial of item count.
 * Display Final Price after all calculations.
 */

void main() {
  // Empty List of Item Prices Declared. 
  List<double> prices = [];

  // Ask users to input item prices that will be added to the list.
  print("Please enter item prices (type 'done' to finish)!.");

  while (true) {
    stdout.write("Enter item price: ");
    String? input = stdin.readLineSync();

    if (input == null) {
      print("Invalid Input. Please re-enter the correct item price.\n");
      continue;
    }

    if (input == "") {
      print("Empty Input. Please enter item price.\n");
      continue;
    }

    if (input.toLowerCase() == "done") {
      break;
    }

    // Try...Except Error
    try {
      double price = double.parse(input);

      if (price < 0) {
        print("Prices cannot be a negative number, re-enter a valid item price.\n");
        continue;
      }
      // Adds item price to the List 'prices'.
      prices.add(price);
    } catch (e) {
      print("Invalid Input! Please enter valid price.\n");

    }
    
  }
  // Print out the added item prices List
  print("\nITEM PRICES LISTS IN DOLLARS(\$): ");
  print(prices);


  // 1. ANONYMOUS FUNCTION THAT FILTERS OUT PRICES < $10.
  prices = prices.where((price) => price >= 10).toList();
  prices.sort();

  // Printing Out Filtered List
  print("\nFiltered Lists in Ascending Order(>= \$10): ");
  print(prices);


  //2. HIGHER-ORDER FUNCTION TO APPLY A FIXED DISCOUNT: 11.99%
  double discPercent = 11.99;

  // A function to calculate the discount of 11.99:
  double discountFunc(double price) => price * (1 - discPercent / 100);

  // Higher-order Function 'applyDiscount' Application
  List<double> itemsDiscounted = applyDiscount(prices, discountFunc);
  itemsDiscounted.sort();

  // Printing out filtered items prices after the higher-order function has being applied
  print("\nPrices After ${discPercent}% Discount in Ascending Order in Dollars(\$): ");
  print("${itemsDiscounted}\n");


  // 3. Calculate Total Price with and without Tax
  double totalWithTax = calculateTotal(itemsDiscounted, taxRate: 7.5);
  double totalWithoutTax = calculateTotal(itemsDiscounted);
  
  print("Total with tax rate: \$${totalWithTax.toStringAsFixed(2)}\n");
  print("Total without tax rate: \$${totalWithoutTax.toStringAsFixed(2)}\n");


  // 4. Apply The Factorial Discount: Recursive Function
  int itemsCount = itemsDiscounted.length;
  double factorialDiscountedPercent = calculateFactorialDiscount(itemsCount).toDouble();
  
  // Caps the factorial discount to a maximum of 50% and no more than that!
  if (factorialDiscountedPercent >= 50) {
    factorialDiscountedPercent = 50;
  }

  // Final Price with The Optional Tax
  double finalPriceWithTax = totalWithTax * (1 - factorialDiscountedPercent / 100);
  print("Final Price with optional tax after factorial(${itemsCount}!) discount of ${factorialDiscountedPercent}%: \$${finalPriceWithTax.toStringAsFixed(2)}\n");

  // Final Price without The Optional Tax
  double finalPriceWithoutTax = totalWithoutTax * (1 - factorialDiscountedPercent / 100);
  print("Final Price without optional tax after factorial(${itemsCount}!) discount of ${factorialDiscountedPercent}%: \$${finalPriceWithoutTax.toStringAsFixed(2)}\n");
   
}

// ************ 1. Higher-order function to apply a discount function to a list of prices ************
List<double> applyDiscount(List<double> prices, double Function(double) discountFunc) {
  return prices.map(discountFunc).toList();
}


// ************ 2. Standard Function: 'calculateTotal' ************
double calculateTotal(List<double> prices, {double taxRate = 0.0}) {
  double subTotal = 0;
  for (double price in prices) {
    subTotal += price;
  }
  double taxCharge = subTotal * (taxRate / 100);
  return subTotal + taxCharge;

}


// ************ 3. Recursive Function: 'calculateFactorialDiscount ' ************
int calculateFactorialDiscount (int n) {
  if (n <= 1) {
    return 1;
  }

  return n * calculateFactorialDiscount(n - 1);
}





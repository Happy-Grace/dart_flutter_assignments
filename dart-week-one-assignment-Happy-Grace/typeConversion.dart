/**
 * Write functions to:
 * Convert String → int & double.
 * Convert int → String & double.
 */

// Function to Convert String to int
int stringToInt(String a) {
  return int.parse(a);
}

// Function to Convert String to double
double stringToDouble(String a) {
  return double.parse(a);
}

// Function to Convert int to String
String intToString(int a) {
  return a.toString();
}

// Function to Convert int to double
double intToDouble(int a) {
  return a.toDouble();
}

void main() {
  // Test the created type conversion functions
  String myString = "231920";
  int myInt = 28372;

  // String to Integer Conversion.
  int newInt = stringToInt(myString);
  print("Confirming the Data Type of the converted variable[string -> int]: ${newInt.runtimeType}");
  print("${myString.runtimeType} \"${myString}\" converted to integer: ${stringToInt(myString)}\n");

  // String to Double Conversion.
  print("${myString.runtimeType} \"${myString}\" converted to double: ${stringToDouble(myString)}\n");

  // Integer to String Conversion.
  String newString = intToString(myInt);
  print("Confirming the Data Type of the converted variable[int -> string]: ${newString.runtimeType}");
  print("Integer ${myInt} converted to ${newString.runtimeType}: ${newString}\n");

  // Integer to Double Conversion.
  print("Integer ${myInt} converted to Double: ${intToDouble(myInt)}\n");
}
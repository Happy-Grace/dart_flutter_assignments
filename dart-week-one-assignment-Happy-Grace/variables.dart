/**
 * Create a Dart program that defines and initializes variables of the following types: 
 * int, double, String, bool, and List.
 */


void main() {
  // Defining some set of variables
  String myName = "Divine Gift";
  int age = 24;
  double height = 173.2;
  bool isPLPStudent = true;

  List<int> myList = [10, 20, 20, 30, 40, 40, 50, 55];

  // Verify the data types of variables created.
  print("String Type: ${myName.runtimeType}");
  print("Integer Type: ${age.runtimeType}");
  print("Double Type: ${height.runtimeType}");
  print("Boolean Type: ${isPLPStudent.runtimeType}");
  print("List Type: ${myList.runtimeType}");

  // Let's print out all variables created.
  print("\nHello, my name is $myName and I am $age years old.\nI am ${height}cm tall and it is $isPLPStudent that I am currently a PLP student.\n");

  // Let's print out the items in a list using the for...in Loop
 for(int i = 0; i < myList.length; i++) {
  print("Item ${i + 1}: ${myList[i]}");
 }
}
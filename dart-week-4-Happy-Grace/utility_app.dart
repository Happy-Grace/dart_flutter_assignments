import 'dart:io';

/**
 * 1. STRING MANIPULATOR CLASS
 */

class StringManipulator {
  String text;

  // Constructor
  StringManipulator(this.text);

  // Function for Concatenation
  String concatenate(String newText) => text + " " + newText;

  // Function for Interpolation
  String interpolate(String name) => "Hello $name, You entered the text: '${text}'";

  // Function for Substring
  String wordSubstring(int start, int end) {
    if (start < 0 || end > text.length || start >= end) {
      return "Invalid Substring Range.\n";
    }

    return text.substring(start, end);
  }

  // Function to Reverse the Text
  /** 
   * Splits the word into a list of characters, 
   * Reverses the list of characters, and 
   * Joins the list of characters back together in a reversed form.
   */

  String reversedWord() => text.split(" ").reversed.join(" ");

  // Function to Convert Text to Uppercase
  String toUpper() => text.toUpperCase();

  // Function to Convert Text to Lowercase
  String toLower() => text.toLowerCase();

  // Function to Count the Length of the Text
  int wordLen() => text.length;


 
}

/**
 * 2. COLLECTION UTILITIES FOR LISTS, MAPS AND SETS
 */
class CollectionUtility {
  List<String> words = [];
  Set<String> uniqueWords = {};
  Map<String, int> wordCounts = {};

  // Function to Process Text
  void processTexts(String text) {
    
    // Splits the text into a list of characters.
    words = text.split(" ");

    // Converts the list into a set of unique characters.
    uniqueWords = words.toSet();

  }

  // Function to Demonstrate Operations on the Collections: Lists, Sets and Maps
  void operationsDemo() {
    print("\n********** LIST OPERATIONS **********");
    
    //Original List
    print("Original List: $words\n");

    words.add("Dart");
    words.add("Flutter");
    words.add("Flutter");
    words.add("name");
    words.add("name");
    // Reprint to display the newly added word
    print("Updated List: $words\n");

    // Making a Copy of the List 'words'
    List<String> newWords = List.from(words);

    // Remove certain range from the copied List
    newWords.removeLast();
    newWords.removeRange(0, 3);

    // Reprint to display the updated list where some elements was removed
    print("Updated List after Removal: $newWords\n");


    print("********** SET OPERATION **********");

    // Original Set
    print("Unique Set: $uniqueWords\n");

    uniqueWords.add("dart");
    uniqueWords.add("flutter");
    uniqueWords.add("dart");
    uniqueWords.add("flutter");
    uniqueWords.add("PLP");
    uniqueWords.add("programs");
    // Reprint to display the newly added word to the set.
    print("Updated Set: $uniqueWords\n");


    print("********** MAP OPERATION **********");
    // Iterate through the list of words and count occurences using a map.
    for(var word in words) {
      wordCounts[word] = (wordCounts[word] ?? 0) + 1;
    }

    // Original Map
    print("Word Counts Map: $wordCounts\n");

    // Removes from the Map
    wordCounts.remove(words.last);
    // Reprints to view updated Map
    print("Updated Word Counts Map: $wordCounts\n");



  }


}


/**
 * 3. FILE HANDLER CLASS:
 * Handles File Input/Output Asynchronously.
 */
class FileHandler {
  
  // Function to Create a File and Write to it Asynchronously
  Future<void> writeToFile(String fileName, String content) async {
    try {
      final file = File(fileName);
      await file.writeAsString(content);
      print("Successfully wrote to $fileName ✅\n");

    } catch (e) {
      print("Error writing to file: ${e} ❌\n");
    }
  }
  
  // Function to Read from a File
  Future<void> readFile(String fileName) async {
    try {
      final file = File(fileName);

      if (await file.exists()) {
        String fileContents = await file.readAsString();
        print("📄 File Contents of $fileName:\n$fileContents\n");

      } else {
        print("$fileName File does not exists ⚠️.\n");
      }
    } catch (e) {
      print("Error reading contents from $fileName file: ${e} ❌.\n");
    }
  }


  // Function to Copy File Contents
  Future<void> copyFile(String source, String dest) async {
    try {
      final sourceFile = File(source);

      if (!await sourceFile.exists()) {
        print("Source File not Found ⚠️\n");
        return;
      }

      final fileContents = await sourceFile.readAsString();
      await writeToFile(dest, fileContents);
      print("Successfully Copied Contents from $source to $dest ✅.\n");

    } catch (e) {
      print("Error occured while copying file: ${e} ❌.\n");
    }

  } 


}

/**
 * 4. DATE AND TIME UTILITIES CLASS: 
 * Handles Date and Time Operations
 */
class DateTimeUtility {

  // Stores System's Current Date and Time
  DateTime now = DateTime.now();


  // Function to Show Current Date and Time
  void showCurrentTimeAndDate() {
    print("********** CURRENT DATE AND TIME **********");
    print("Current Time and Date: $now\n");
  }

  void formatDate() {
    print("********** FORMATS DATE AS 'YYYY-MM-DD' **********");
    
    String formattedDate = 
        '${now.year}-${now.month.toString().padLeft(2, "0")}-${now.day.toString().padLeft(2, "0")}';

    print("Formatted Date: ${formattedDate}\n");

  }

  // ADDING DAYS
  void addDays(int days) {
    DateTime newDate = now.add(Duration(days: days));

    // Print the New Date after Adding Days
    print("********** NEW DATE AFTER ADDING ${days} DAYS **********");
    print("Newly Updated Date after adding $days days: $newDate\n");
  }


  // SUBTRACTING DAYS
  void subtractDays(int days) {
    DateTime newDate = now.subtract(Duration(days: days));

    // Print the New Date after Subtracting Days
    print("********** NEW DATE AFTER SUBTRACTING ${days} DAYS **********");
    print("Newly Updated Date after subtracting $days days: $newDate\n");
  }


  // DATE DIFFERENCE
  void dateDiff(DateTime another) {
    // Calculates days difference between two DateTime objects: 'now' and 'another'
    Duration diff = now.difference(another);

    print("********** DATE DIFFERENCE IN DAYS BETWEEN 'now' AND 'another' DATETIME OBJECTS **********");
    print('Difference between $now and $another: ${diff.inDays} days');
  }

}


/**
 * 5. UTILITY APP CLASS: 
 * Runs all other orchestrators
 */

class UtilityApp {
  Future<void> runUtilities() async{
    print("********** DART UTILITY APP **********");

    stdout.write("Enter any text or word(e.g: Welcome to Dart!): ");
    String? input = stdin.readLineSync();

    // Input Validation
    if (input == null || input.isEmpty) {
      print("No input provided. Exiting...\n");
      return;
    }

      // Object of StringManipulation Class
      var stringUtility = StringManipulator(input);
      
      // ********** STRING UTILITIES **********
      print("\n####### String Manipulation #######");
      print("Original Text: ${stringUtility.text}");
      print("Concatenation: ${stringUtility.concatenate("New Word")}");
      print("Interpolation: ${stringUtility.interpolate("Guest")}");
      print("Substring: ${stringUtility.wordSubstring(0, 10)}");
      print("Uppercase Conversion: ${stringUtility.toUpper()}");
      print("Lowercase Conversion: ${stringUtility.toLower()}");
      print("Reversed Word: ${stringUtility.reversedWord()}");
      print("Word Length Count: ${stringUtility.wordLen()}\n");



    // Object of Collection Utilities
    var collectionUtils = CollectionUtility();

    // ********** COLLECTION UTILITIES **********
    print("####### COLLECTION UTILITIES: LIST, SET AND MAPS #######");
    collectionUtils.processTexts(input);
    collectionUtils.operationsDemo();



    // ********** FILE HANDLING UTILITY **********
    var fileHandler = FileHandler();
    await fileHandler.writeToFile("input.txt", input);
    await fileHandler.readFile("input.txt");
    await fileHandler.copyFile("input.txt", "new_file.txt");



    // ********** DATE AND TIME UTILITY **********
    var dateTimeUtils = DateTimeUtility();
    dateTimeUtils.showCurrentTimeAndDate();
    dateTimeUtils.formatDate();
    dateTimeUtils.addDays(5);
    dateTimeUtils.subtractDays(10);
    dateTimeUtils.dateDiff(DateTime(2025, 10, 29));


    print('\n All utilities executed successfully!✅✅');

  }
  
}



// ############ MAIN FUNCTION ############
void main() async {
  var my_app = UtilityApp();
  await my_app.runUtilities();

}




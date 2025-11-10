import 'dart:io';

/**
 * OBJECT-ORIENTED PRINCIPLES PARADIGM
 * EMPLOYEE MANAGEMENT SYSTEM (EMS)
 * Demonstrates OOP: Encapsulation, Abstraction, Inheritance, Polymorphism
 */


/**
 * 1. ABSTRACTION
 * Defines the Abstract Class of Employees
 */

abstract class Employees {
  String firstName;
  String lastName;
  int age;
  int id;

  // Constructor of the class Employees
  Employees(this.firstName, this.lastName, this.age, this.id);


  // Abstract Methods
  void displayInfo();
  double calculateSalary();

}

/**
 * 2. INHERITANCE AND POLYORPHISM
 * Demonstrates Inheritance of the created abstract class taking many forms (Polymorphism).
 */

// Sub-class for Full Time Workers
class FullTimeEmployee extends Employees {
  double monthlyWage;

  // Constructor
  FullTimeEmployee(
    String firstName, 
    String lastName, 
    int age, 
    int id, 
    this.monthlyWage
    ): super(firstName, lastName, age, id);

  // Variable for fullName using GETTER METHOD
  String get fullName => "${firstName} ${lastName}";



  // Polymorphism Demonstration Using 'Override' Keyword
  @override
  void displayInfo() {
    print("Full-Time Employee: $fullName.");
    print("Age: ${age} yrs old.");
    print("ID: #$id.");
  }

  @override
  double calculateSalary() => monthlyWage;

}


// Sub-class for Part-Time Workers
class PartTimeEmployee extends Employees {
  double hoursRate;
  double hoursWorked;

  PartTimeEmployee(
    String firstName, 
    String lastName, 
    int age, 
    int id, 
    this.hoursRate, 
    this.hoursWorked
    ): super(firstName, lastName, age, id);

    String get fullName => "$firstName $lastName";

    @override
    void displayInfo() {
      print("Part-Time Employee: $fullName.");
      print("Age: ${age} yrs old.");
      print("ID: #${id}");
    }

    @override
    double calculateSalary() => hoursRate * hoursWorked;

}


/**
 * 3. ENCAPSULATION
 * Demonstrates the Encapsulation Paradigm in OOP.
 */

class DivinoxCompany {
  // Private list of employees
  final List<Employees> _employees = [];

  // Public method to add an employee
  void addEmployee(Employees emp) {
    _employees.add(emp);
    print('${emp.firstName} ${emp.lastName} added to Divinox Company.\n');
  }

  // Public method to show all employees
  void showAllEmployees() {
    print('\n----- Employees List -----\n');
    for (var emp in _employees) {
      emp.displayInfo();
      print('Salary: \$${emp.calculateSalary()}');
      print('');
    }
  }
  
}

// MAIN FUNCTION
void main() {
  // Creating a company class/method
  var myCompany = DivinoxCompany();

  
  // Creating Employees (Inheritance)
  var emp1 = FullTimeEmployee('Lily', 'Dave', 24, 101, 120000);
  var emp2 =  FullTimeEmployee('Joe', 'Barney', 28, 102, 110000);
  var emp3 = FullTimeEmployee('Lisa', 'Jones', 28, 103, 125000);
  var emp4 = PartTimeEmployee('Rosie', 'Park', 29, 104, 12000, 8.5);
  var emp5 = PartTimeEmployee('Mike', 'Fawn', 30, 105, 11000, 8);


  // Adding New Employees to the Company's List.
  myCompany.addEmployee(emp1);
  myCompany.addEmployee(emp2);
  myCompany.addEmployee(emp3);
  myCompany.addEmployee(emp4);
  myCompany.addEmployee(emp5);


  // Showing All Employees of the Company
  myCompany.showAllEmployees();


}



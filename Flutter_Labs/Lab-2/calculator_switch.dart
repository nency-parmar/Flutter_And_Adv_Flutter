import 'dart:io';

void main() {
  print("Enter 1st number: ");
  double num1 = double.parse(stdin.readLineSync()!);
  print("Enter 2nd number: ");
  double num2 = double.parse(stdin.readLineSync()!);

  print("Choose an Operation:");
  print("1: Addition (+)");
  print("2: Subtraction (-)");
  print("3: Multiplication (*)");
  print("4: Division (/)");
  int choice = int.parse(stdin.readLineSync()!);

  switch (choice)
  {
    case 1:
      print("Result: ${num1 + num2}");
      break;
    case 2:
      print("Result: ${num1 - num2}");
      break;
    case 3:
      print("Result: ${num1 * num2}");
      break;
    case 4:
      if (num2 != 0)
      {
        print("Result: ${num1 / num2}");
      }
      else
      {
        print("Error: Division by zero is not allowed.");
      }
      break;
    default:
      print("Invalid choice! Please select a number between 1 and 4.");
  }
}
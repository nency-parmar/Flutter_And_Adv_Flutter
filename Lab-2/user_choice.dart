import 'dart:io';
void main()
{
  print("Enter 1st Number : ");
  int n1 = int.parse(stdin.readLineSync()!);
  print("Enter 2nd Number : ");
  int n2 = int.parse(stdin.readLineSync()!);
  print("Enter your Choice: ");
  print("Enter 1 for Addition : ");
  print("Enter 2 for Substraction : ");
  print("Enter 3 for Multiplication : ");
  print("Enter 4 for Division : ");
  int choice = int.parse(stdin.readLineSync()!);

  // Calculate 2 Numbers Using if - else.

  // if(choice == 1)
  //   {
  //     int sum = n1 + n2;
  //     print("Sum Of $n1 and $n2 is $sum.");
  //   }
  // else if(choice == 2)
  //   {
  //     int sub = n1 - n2;
  //     print("Substraction Of $n1 and $n2 is $sub.");
  //   }
  // else if(choice == 3)
  //   {
  //     int multi = n1 * n2;
  //     print("Multiplication Of $n1 and $n2 is $multi.");
  //   }
  // else if(choice == 4)
  //   {
  //     double div = n1 / n2;
  //     print("Division Of $n1 and $n2 is $div.");
  //   }
  // else
  //   {
  //     print("Please Enter Valid Number!!");
  //   }

// Calculate 2 Numbers Using switch - case.

  switch (choice) {
    case 1:
      int sum = n1 + n2;
      print("Sum of $n1 and $n2 is $sum.");
      break;
    case 2:
      int sub = n1 - n2;
      print("Subtraction of $n1 and $n2 is $sub.");
      break;
    case 3:
      int multi = n1 * n2;
      print("Multiplication of $n1 and $n2 is $multi.");
      break;
    case 4:
      if (n2 != 0) {
        double div = n1 / n2;
        print("Division of $n1 by $n2 is $div.");
      } else {
        print("Division by zero is not allowed.");
      }
      break;
    default:
      print("Invalid choice! Please enter a number between 1 and 4.");
  }
}
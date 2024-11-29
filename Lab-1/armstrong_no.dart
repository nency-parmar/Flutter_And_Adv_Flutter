import 'dart:io';

void main() {
  print("Enter a Number: ");
  int num = int.parse(stdin.readLineSync()!);
  int temp = num;
  int sum = 0;
  int rem = 0;

  while (num != 0)
  {
    rem = num % 10;
    sum = sum + (rem * rem * rem);
    num = num ~/ 10;
  }

  print("Sum of digits is: $sum");

  if (sum == temp)
  {
    print("$temp is an Armstrong Number.");
  }
  else
  {
    print("$temp is Not an Armstrong Number.");
  }
}
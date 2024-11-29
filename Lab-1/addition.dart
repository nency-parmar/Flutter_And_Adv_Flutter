import 'dart:io';
void main()
{
  print("Enter 1st Number : ");
  int n1 = int.parse(stdin.readLineSync()!);
  print("Enter 2nd Number : ");
  int n2 = int.parse(stdin.readLineSync()!);
  int sum = n1 + n2;
  print("Sum Of $n1 and $n2 Numbers is : $sum");
}

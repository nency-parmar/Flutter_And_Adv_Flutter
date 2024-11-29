import 'dart:io';
void main()
{
  double total = 500;
  print("Enter 1st Subject Marks : ");
  int n1 = int.parse(stdin.readLineSync()!);
  print("Enter 2nd Subject Marks : ");
  int n2 = int.parse(stdin.readLineSync()!);
  print("Enter 3rd Subject Marks : ");
  int n3 = int.parse(stdin.readLineSync()!);
  print("Enter 4th Subject Marks : ");
  int n4 = int.parse(stdin.readLineSync()!);
  print("Enter 5th Subject Marks : ");
  int n5 = int.parse(stdin.readLineSync()!);
  int sum = (n1+n2+n3+n4+n5);
  double per = (sum*100)/total;
  print("Percentage of 5 Subjects is : $per%");
}
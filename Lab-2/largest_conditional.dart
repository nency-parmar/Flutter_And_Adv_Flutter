import 'dart:io';
void main()
{
  print("Enter 1st Number: ");
  int n1 = int.parse(stdin.readLineSync()!);
  print("Enter 2nd Number: ");
  int n2 = int.parse(stdin.readLineSync()!);
  print("Enter 3rd Number: ");
  int n3 = int.parse(stdin.readLineSync()!);
  int large = (n1 > n2) ? ((n1 > n3 ) ? n1 : n3) : (( n2 > n3 ) ? n2 : n3);
  print("$large is Largest Number.");
}
import 'dart:io';
void main()
{
  print("Enter 1st Number: ");
  int n1 = int.parse(stdin.readLineSync()!);
  print("Enter 2nd Number: ");
  int n2 = int.parse(stdin.readLineSync()!);
  print("Enter 3rd Number: ");
  int n3 = int.parse(stdin.readLineSync()!);
  if(n1 > n2)
    {
      print("$n1 is Largest.");
    }
  else if(n2 > n3)
    {
      print("$n2 is Largest.");
    }
  else
    {
      print("$n3 is Largest.");
    }
}
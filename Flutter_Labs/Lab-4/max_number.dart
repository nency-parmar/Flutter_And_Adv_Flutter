import 'dart:io';

void main()
{
  print("Enter 1st Number : ");
  int n1 = int.parse(stdin.readLineSync()!);
  print("Enter 2nd Number : ");
  int n2 = int.parse(stdin.readLineSync()!);
  max_num(n1,n2);
}

void max_num(int n1 , int n2)
{
  if(n1 < n2)
    {
      print("$n2 is Largest.");
    }
  else
    {
      print("$n1 is Largest.");
    }
}
import 'dart:io';

void main()
{
  print("Enter principal : ");
  double p = double.parse(stdin.readLineSync()!);
  print("Enter Rate : ");
  double r = double.parse(stdin.readLineSync()!);
  print("Enter Time : ");
  double t = double.parse(stdin.readLineSync()!);
  interest(p,r,t);
}

void interest(double p,double r,double t)
{
  double ans = (p*r*t)/100;
  print("The Simple Interest is : $ans");
}
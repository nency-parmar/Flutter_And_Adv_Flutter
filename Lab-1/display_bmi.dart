import 'dart:io';
void main()
{
  print("Enter Your Weight in Pounds : ");
  double weight = double.parse(stdin.readLineSync()!);
  print("Enter Your Height in Inches : ");
  double height = double.parse(stdin.readLineSync()!);
  double new_weight = (weight*0.45359237);
  double new_height = (height*0.254);
  print("Your Weight in Kgs is $new_weight kg AND Height in Meters is $new_height m");
}
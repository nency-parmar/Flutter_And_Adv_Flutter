import 'dart:io';
void main()
{
  print("Enter Number in Meter : ");
  double met = double.parse(stdin.readLineSync()!);
  double feet = (met * 3.28084);
  print("Meter into feet is : $feet");
}
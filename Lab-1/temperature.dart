import 'dart:io';
void main()
{
  print("Enter Fahrenheit : ");
  double far = double.parse(stdin.readLineSync()!);
  double cel = ((far - 32) * 5/9);
  print("Temperature in Celsius is : $cel");
}

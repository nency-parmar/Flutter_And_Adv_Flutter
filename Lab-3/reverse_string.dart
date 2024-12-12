import 'dart:io';

void main()
{
  print("Enter a String : ");
  String str = stdin.readLineSync()!;
  String new_str = str.split('').reversed.join();

  print("Reversed String is : $new_str");
}
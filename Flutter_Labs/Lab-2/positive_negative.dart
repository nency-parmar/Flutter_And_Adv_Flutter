import 'dart:io';
void main()
{
  print("Enter a Number: ");
  int num = int.parse(stdin.readLineSync()!);
  if(num < 0)
  {
    print("$num is Negative Number.");
  }
  else
  {
    print("$num is Positive Number.");
  }
}
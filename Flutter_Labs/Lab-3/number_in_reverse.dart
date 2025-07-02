import 'dart:io';

void main()
{
  print("Enter a Number : ");
  int num = int.parse(stdin.readLineSync()!);
  int temp = 1;
  int a = 0;
  while(num != 0)
    {
      temp = num % 10;
      a = a * 10 + temp;
      num = num ~/ 10;
    }
  print("Reverse of is : $a");
}
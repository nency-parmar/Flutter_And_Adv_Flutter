import 'dart:io';

void main()
{
  print("Enter a Number : ");
  int num = int.parse(stdin.readLineSync()!);
  int temp = 1;
  for(int i=1;i<=num;i++)
    {
      if(num == 0)
        {
          print(1);
        }
      else
        {
          temp *= i;
        }
    }
  print("Factorial of $num is : $temp");
}
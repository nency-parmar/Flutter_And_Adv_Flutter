import 'dart:io';

void main()
{
  print("Enter a Number : ");
  int num = int.parse(stdin.readLineSync()!);
  int temp = 0;
  for(int i=1;i<=num;i++)
    {
      if(num % i == 0)
        {
          temp++;
        }
    }
  if(temp == 2)
    {
      print("$num is Prime Number.");
    }
  else
    {
      print("$num is Not a Prime Number.");
    }
}
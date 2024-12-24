import 'dart:io';

void main()
{
  print("Enter 1st Number : ");
  int num = int.parse(stdin.readLineSync()!);
  prime(num);
}

void prime(int num)
{
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
      print("Number is Prime.");
      // return 1;
    }
  else
    {
      print("Number is Not Prime.");
      // return 0;
    }
}
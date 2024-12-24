import 'dart:io';

void main()
{
  print("Enter The End Number of Series : ");
  int num = int.parse(stdin.readLineSync()!);
  fibonacci_series(num);
}

void fibonacci_series(num)
{
  int temp = 0;
  int temp1 = 1;
  print("Fibonacci Series is : ");
  print(temp);
  print(temp1);
  for(int i=2;i<num;i++)
    {
      int ans = temp + temp1;
      temp = temp1;
      temp1 = ans;
      print("$temp1");
    }
}
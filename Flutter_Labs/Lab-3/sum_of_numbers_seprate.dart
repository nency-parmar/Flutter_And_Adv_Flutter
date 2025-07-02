import 'dart:io';

void main()
{
  int even_sum = 0;
  int odd_sum = 0;
  while(true)
    {
      print("Enter 0 to Quite.");
      print("Enter a Number : ");
      int num = int.parse(stdin.readLineSync()!);
      if(num % 2 == 0 && num > 0)
        {
          even_sum += num;
        }
      else if(num % 2 != 0 && num < 0)
        {
          odd_sum += num;
        }
      if(num == 0)
        {
          break;
        }
    }
    print("Sum Of Even Positive Numbers is : $even_sum");
    print("Sum Of Odd Negative Numbers is : $odd_sum");
}
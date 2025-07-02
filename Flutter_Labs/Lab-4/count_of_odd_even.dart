import 'dart:io';

void main()
{
  int count_even = 0;
  int count_odd = 0;
  List<int> list = [];
  while(true)
  {
    print("Enter -1 to Quite.");
    print("Enter a Number : ");
    int num = int.parse(stdin.readLineSync()!);
    if (num == -1)
    {
      break;
    }
    else
    {
      list.add(num);
    }
  }
    for(int i=0;i<list.length;i++)
    {
      if (i % 2 == 0)
      {
        count_even++;
        print("Count Of Even Numbers is : $count_even $i");

      }
      else
      {
        count_odd++;
        print("Count Of Odd Numbers is : $count_odd $i");
      }
    }
  print("Count Of Even Numbers is : $count_even");
  print("Count Of Odd Numbers is : $count_odd");
}
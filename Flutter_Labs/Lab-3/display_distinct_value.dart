import 'dart:io';

void main()
{
  List<int> list = [];
  while(true)
    {
      print("Enter -1 to Quite.");
      print("Enter a Number : ");
      int num = int.parse(stdin.readLineSync()!);
      if(num == -1)
        {
          break;
        }
      else
        {
          list.add(num);
        }
    }
  int ans = 0;
  for(int i=0;i<list.length;i++)
    {
      ans ^= list[i];
      // print(ans);
    }
  print(ans);
}
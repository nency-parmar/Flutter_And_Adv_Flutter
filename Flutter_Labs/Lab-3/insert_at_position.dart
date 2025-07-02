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
}
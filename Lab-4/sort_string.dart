import 'dart:io';

void main()
{
  List<String> list = [];
  while(true)
  {
    print("Enter stop to Quite.");
    print("Enter a String : ");
    String str = stdin.readLineSync()!;
    if(str == 'stop')
    {
      break;
    }
    else
    {
      list.add(str);
    }
  }
  print("List Before Sort : ");
  print(list);
  print("List After Sort : ");
  list.sort();
  print(list);
}

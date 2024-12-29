import 'dart:io';

void main()
{
  List<int> list = [];

  for(int i=0;i<5;i++)
    {
      print("Enter $i Number : ");
      int num = int.parse(stdin.readLineSync()!);
      list.add(num);
    }
  print("Before Ordered : $list");
  list.sort();
  print("After Ordered : $list");
}
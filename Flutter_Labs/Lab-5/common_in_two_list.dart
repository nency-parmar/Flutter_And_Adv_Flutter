import 'dart:io';

void main()
{
  List<int> list1 = [];
  List<int> list2 = [];
  List<int> list3 = [];
  print("Enter Size Of Both Lists : ");
  int n = int.parse(stdin.readLineSync()!);
  for(int i=0;i<n;i++)
  {
    print("Enter For List-1 $i Number : ");
    int num = int.parse(stdin.readLineSync()!);
    list1.add(num);
  }
  for(int i=0;i<n;i++)
  {
    print("Enter For List-2 $i Number : ");
    int num1 = int.parse(stdin.readLineSync()!);
    list2.add(num1);
  }

  print("List - 1 : $list1");
  print("List - 2 : $list2");

  for(int i=0;i<list1.length;i++)
    {
      for(int j=0;j<list2.length;j++)
        {
          // print("${list1[i]} , ${list2[j]}");
          if(list1[i] == list2[j])
            {
              list3.add(list1[i]);
            }
        }
    }

  print("List Of Common Between List-1 & List-2 : $list3");
}
import 'dart:io';

void main()
{
  print("Enter Starting Number Of Series : ");
  int n1 = int.parse(stdin.readLineSync()!);
  print("Enter Ending Number Of Series : ");
  int n2 = int.parse(stdin.readLineSync()!);
  int j = 1;
  print("Numbers Between $n1 And $n2 are : ");
  for(int i=n1;i<=n2;i++)
  {
      if(i%2 == 0 && i%3 != 0)
      {
        print("${i}");
      }
  }
}
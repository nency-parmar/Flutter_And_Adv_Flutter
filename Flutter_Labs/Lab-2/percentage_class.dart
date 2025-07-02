import 'dart:io';
void main()
{
  double total = 500;
  print("Enter Sub-1 Marks : ");
  int n1 = int.parse(stdin.readLineSync()!);
  print("Enter Sub-2 Marks : ");
  int n2 = int.parse(stdin.readLineSync()!);
  print("Enter Sub-3 Marks : ");
  int n3 = int.parse(stdin.readLineSync()!);
  print("Enter Sub-4 Marks : ");
  int n4 = int.parse(stdin.readLineSync()!);
  print("Enter Sub-5 Marks : ");
  int n5 = int.parse(stdin.readLineSync()!);

  int sum = (n1+n2+n3+n4+n5);
  double per = (sum*100)/total;
  print("Percentage of 5 Subjects is : $per%");

  if(per > 70)
    {
      print("Distinction!!!");
    }
  else if(per<60 && per>=70)
    {
      print("First Class!!!");
    }
  else if(per<45 && per>=60)
  {
    print("Second Class!!!");
  }
  else if(per<35 && per>=45)
  {
    print("Pass!!!");
  }
  else
    {
      print("Fail!!!");
    }
}
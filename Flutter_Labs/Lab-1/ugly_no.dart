import 'dart:io';
void main()
{
  print("Enter a Number: ");
  int num = int.parse(stdin.readLineSync()!);
  int i=1;
  for(i=1;i<num;i++)
    {
      if(num%i == 0)
      {
        print(i);
      }
    }
  if(i==2 || i==3 || i==5)
    {
      print("Number is Ugly.");
    }
  else
    {
      print("Number is Not Ugly.");
    }
}
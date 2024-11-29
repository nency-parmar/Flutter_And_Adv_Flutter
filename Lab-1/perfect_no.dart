import 'dart:io';
void main()
{
  print("Enter a Number: ");
  int num = int.parse(stdin.readLineSync()!);
  int i = 1;
  int sum = 0;
  for (i = 1; i < num; i++) {
    if (num % i == 0) {
      sum += i;
    }
  }
  if(sum == num)
    {
      print("$num is Perfect Number.");
    }
  else
    {
      print("$num is Not a Perfect Number.");
    }
}
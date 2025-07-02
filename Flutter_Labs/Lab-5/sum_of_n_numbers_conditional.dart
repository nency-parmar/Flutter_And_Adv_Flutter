import 'dart:io';

void main()
{
  List<int> list = [];
  while (true)
  {
    print("Enter -1 to Break.");
    print("Enter a Number: ");
    int num = int.parse(stdin.readLineSync()!);
    if (num == -1)
    {
      break;
    }
    list.add(num);
  }
  int sum = 0;
  for (int i = 0; i < list.length; i++) {
    if (list[i] % 3 == 0 || list[i] % 5 == 0)
    {
      sum += list[i];
    }
  }
  print("Sum of All Numbers Divisible By 3 or 5: $sum");
}
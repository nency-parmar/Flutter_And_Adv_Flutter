import 'dart:io';

void main()
{
  print("Enter String here : ");
  String str = stdin.readLineSync()!;
  print(str);
  List list = str.split(" ");
  print("List is : $list");
  print("Last Word of the List is : ${list.last}");
  print("Length Of The Last Word is : ${list.last.length}");
}
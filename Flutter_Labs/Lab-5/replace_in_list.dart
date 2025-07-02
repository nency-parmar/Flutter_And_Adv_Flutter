import 'dart:io';

void main()
{
  List<String> list = [];
  while (true)
  {
    print("Enter -1 to Break.");
    print("Enter a String : ");
    String city = stdin.readLineSync()!;
    if (city == '-1')
    {
      break;
    }
    list.add(city);
  }
  print("List Of City Before Replace : $list");
  print("Enter That City Where you want to Replace : ");
  String target = stdin.readLineSync()!;
  print("Enter That City Name With you want to Replace : ");
  String replace = stdin.readLineSync()!;
  List<String> ul = list.map((ul) => ul == target ? replace : ul).toList();
  print("List Of City After Replace : $ul");
}
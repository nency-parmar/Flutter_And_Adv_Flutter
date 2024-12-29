import 'dart:io';

void main()
{
  Map<String, int> phoneBook = {};

  while(true)
  {
    print("Enter 0 for Break.");
    // Add PhoneNumbers...
    print("Enter Name : ");
    String str = stdin.readLineSync()!;
    if(str == '0')
    {
      break;
    }
    print("Enter Phone Number : ");
    int n = int.parse(stdin.readLineSync()!);
    print("Enter Age : ");
    int age = int.parse(stdin.readLineSync()!);
    phoneBook[str] = n;
  }
  print("List Of Friends Details : ");
  print(phoneBook);
}
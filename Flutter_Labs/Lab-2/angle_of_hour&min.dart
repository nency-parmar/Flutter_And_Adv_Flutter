import 'dart:io';

void main()
{
  print("Enter hours (0-12) : ");
  int hours = int.parse(stdin.readLineSync()!);

  print("Enter minutes (0-59) : ");
  int minutes = int.parse(stdin.readLineSync()!);

  if (hours < 0 || hours > 12 || minutes < 0 || minutes > 59)
  {
    print("Invalid input! Hours must be between 0-12 and minutes between 0-59.");
    return;
  }

  double hourAngle = (hours % 12) * 30 + (minutes * 0.5);
  double minuteAngle = minutes * 6;

  double angle = (hourAngle - minuteAngle).abs();

  angle = angle > 180 ? 360 - angle : angle;

  print("The angle between the hour and minute hands is $angle degrees.");
}
import 'package:advance_flutter_lab/lab1/inheritance/parent_class.dart';

class Child extends Parent{

  @override
  void talk() {
    // TODO: implement talk
    super.talk();
    print("Child is talking");
  }

  @override
  void walk() {
    // TODO: implement walk
    super.walk();
    print("Child is walking");
  }

  void main(){
    walk();
    talk();
  }
}
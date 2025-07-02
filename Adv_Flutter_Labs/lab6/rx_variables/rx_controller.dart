import 'package:get/get.dart';

class RxnController extends GetxController{
  RxInt number = 0.obs;

  void increment(){
    number++;
  }

  void decrement(){
    number--;
  }

  void reset(){
    number.value = 0;
  }

}
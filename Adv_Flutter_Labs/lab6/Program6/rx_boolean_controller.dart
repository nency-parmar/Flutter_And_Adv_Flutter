import 'package:get/get.dart';

class RxBooleanController extends GetxController{
  RxBool isVar = false.obs;

  void Change(){
    isVar.value = !isVar.value;
  }
}
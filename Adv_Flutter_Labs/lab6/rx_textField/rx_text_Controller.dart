import 'package:get/get.dart';

class RxTextController extends GetxController{
  RxString inputText = ''.obs;

  void updateText(String value){
    inputText.value = value;
  }
}
import 'package:advance_flutter_lab/lab7/RxList_View/rx_list_model.dart';
import 'package:advance_flutter_lab/utils/import_export.dart';
import 'package:get/get.dart';

class RsListController extends GetxController{
  RxList<dynamic> list = <dynamic>[].obs;

  // TextEditingController nameController = TextEditingController();

  void addUser(String name){
    list.add(
        RxListModel(
          name: name,
          isFav: false
        )
    );
    // update();
  }

  void updateFavourite(int index){
    RxListModel model = list[index];
    model.isFav = !model.isFav;
    list[index] = model;
    update();
  }
}
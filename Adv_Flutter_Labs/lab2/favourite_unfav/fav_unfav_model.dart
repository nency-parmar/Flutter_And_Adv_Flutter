import 'package:advance_flutter_lab/utils/import_export.dart';
class FavUnfavModel{
  List<Map<String , dynamic>> userList = [
    {
      USERNAME:"Student1",
      AGE : 25,
      GRADUATIONYEAR : 2027,
      IS_FAV:0,
    },
    {
      USERNAME:"Student2",
      AGE : 29,
      GRADUATIONYEAR : 2025,
      IS_FAV:0,
    },
  ];

  List<dynamic> favList = [];
  void toggleFavourite(dynamic student){
    if(favList.contains(student)){
      favList.remove(student);
    }
    else{
      favList.add(student);
    }
  }

  bool isFavoriteListContainsProduct(dynamic product){
    return favList.contains(product);
  }

}
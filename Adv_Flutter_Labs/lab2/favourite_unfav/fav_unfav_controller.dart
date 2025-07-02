import 'package:advance_flutter_lab/lab2/favourite_unfav/fav_unfav_model.dart';

class FavUnfavController{
  FavUnfavModel _favUnfavModel = FavUnfavModel();

  toggleFavorite(student) => _favUnfavModel.toggleFavourite(student);

  List<dynamic> getStudent() => _favUnfavModel.userList;
  List<dynamic> favList() => _favUnfavModel.favList;

  bool isFavoriteListContainsProduct(student) => _favUnfavModel.isFavoriteListContainsProduct(student);
}
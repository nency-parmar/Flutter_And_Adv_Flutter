class RxListModel{
  String? _name;

  String get name => _name!;

  set name(String value) {
    _name = value;
  }

  bool? _isFav;

  bool get isFav => _isFav!;

  set isFav(bool value) {
    _isFav = value;
  }

  RxListModel({String? name , bool? isFav}){
    _name = name;
    _isFav = isFav;
  }
}
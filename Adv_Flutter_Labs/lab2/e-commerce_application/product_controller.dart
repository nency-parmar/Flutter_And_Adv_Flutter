import 'package:advance_flutter_lab/utils/import_export.dart';

class ProductController{

  ProductModel _model = ProductModel();

  List<dynamic> categories  = ['Electricals' , 'Home Appliances' , 'Clothing' , 'Skin and Hair'];
  List<dynamic> carted_products = [];

  List<dynamic> getProduct() => _model.getProductList();

  List<dynamic> getCartProdicts() => carted_products;

  List<dynamic> getElectricalProducts() => _model.electricals;
  List<dynamic> getHomeApllicancesProducts() => _model.home_Applicances;
  List<dynamic> getSkinCareProducts() => _model.SkinCare;
  List<dynamic> getClothingProducts() => _model.Clothing;

  void addProduct(dynamic product) => _model.addProduct(product);


}
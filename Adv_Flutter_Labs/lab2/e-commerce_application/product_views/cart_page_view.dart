import 'package:advance_flutter_lab/lab2/e-commerce_application/product_views/product_detail.dart';
import 'package:advance_flutter_lab/utils/import_export.dart';
import 'package:flutter/cupertino.dart';

class CartPageView extends StatefulWidget {
  const CartPageView({super.key});

  @override
  State<CartPageView> createState() => _CartPageViewState();
}

class _CartPageViewState extends State<CartPageView> {
  List<dynamic> carted = ProductView.controller.getCartProdicts();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APPBAR_TITLE_OF_CART_PRODUCT , style: TextStyle(),),
      ),
      body:  ListView(
        children: [
          GridView.builder(
            shrinkWrap: true,
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              // dynamic products = ProductView.controller.getCartProdicts();
              return Card(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return ProductDetail(products: ProductView.controller.getCartProdicts().toList(), index: index,);
                    },));
                  },
                  child: Column(
                    children: [
                      Expanded(
                          child: Image.network(
                            carted[index][PRODCUT_URL],
                          )),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(carted[index][PRODUCT_NAME].toString()),
                                Text(carted[index][PRODUCT_PRICE].toString()),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return CupertinoAlertDialog(
                                    title: Text("Delete From CART"),
                                    content: Text("Are you sure you want to remove this product from cart?"),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          setState(() {
                                            carted.removeAt(index);
                                          });
                                          Navigator.of(context).pop(); // Close dialog
                                        },
                                        child: Text("YES"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(); // Just close dialog
                                        },
                                        child: Text("NO"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: Icon(Icons.remove_shopping_cart),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              );
            },
            itemCount: carted.length,
          )
        ],
      ),
    );
  }
}

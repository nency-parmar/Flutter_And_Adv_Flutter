import 'package:advance_flutter_lab/utils/import_export.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

  TextEditingController _controllerProductName  = TextEditingController();
  TextEditingController _controllerProductUrl = TextEditingController();
  TextEditingController _controllerProductPrice = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.blueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),),
        title: Text(APPBAR_TITLE_OF_ADD_PRODUCT_PAGE , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16)
                  ),
                  hintText: "Enter Product Name"
                ),
                controller: _controllerProductName,
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16)
                    ),
                  hintText: "Enter Product Price"
                ),
                controller: _controllerProductPrice,
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16)
                    ),
                  hintText: "Enter Product Photo using URL"
                ),
                controller: _controllerProductUrl,
              ),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: () {
                Map<String , dynamic> product = {};
                product[PRODUCT_NAME] = _controllerProductName.text;
                product[PRODUCT_PRICE] = _controllerProductPrice.text;
                product[PRODCUT_URL] = _controllerProductUrl.text;

                  ProductView.controller.addProduct(product);
                  debugPrint(product.toString());
                  debugPrint(ProductView.controller.getProduct().toString());
                  setState(() {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  });
                }, child: Text("Add Product")
              )

            ],
          )
        ],
      ),
    );
  }
}

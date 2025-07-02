import 'package:advance_flutter_lab/lab2/e-commerce_application/product_views/banner.dart';
import 'package:advance_flutter_lab/lab2/e-commerce_application/product_views/cart_page_view.dart';
import 'package:advance_flutter_lab/lab2/e-commerce_application/product_views/catagory.dart';
import 'package:advance_flutter_lab/lab2/e-commerce_application/product_views/product_detail.dart';
import 'package:advance_flutter_lab/utils/import_export.dart';

class ProductView extends StatefulWidget {
  ProductView({super.key});

  static ProductController controller = ProductController();

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
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
          ),
        ),
        centerTitle: true,
        title: Text(
          APPBAR_TITLE_OF_E_COMMERCE_VIEW_PAGE,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CartPageView()),
                );
              },
              icon: const Icon(Icons.shopping_cart_rounded),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Catagory(catagories: ProductView.controller.categories),
          BannerClass(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.75,
              ),
              itemCount: ProductView.controller.getProduct().length,
              itemBuilder: (context, index) {
                final products = ProductView.controller.getProduct();
                final product = products[index];

                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductDetail(
                            products: products.toList(),
                            index: index,
                          ),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 6,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12)),
                            child: Image.network(
                              product[PRODCUT_URL],
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.broken_image, size: 50),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product[PRODUCT_NAME].toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "₹ ${product[PRODUCT_PRICE]}",
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Spacer(),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                    icon: ProductView.controller.carted_products
                                        .contains(product)
                                        ? const Icon(Icons.remove_shopping_cart,
                                        color: Colors.red)
                                        : const Icon(
                                        Icons.add_shopping_cart_sharp,
                                        color: Colors.blueAccent),
                                    onPressed: () {
                                      setState(() {
                                        if (ProductView.controller
                                            .carted_products
                                            .contains(product)) {
                                          ProductView.controller.carted_products
                                              .remove(product);
                                        } else {
                                          ProductView.controller.carted_products
                                              .add(product);
                                        }
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.indigo, Colors.deepPurple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: Icon(Icons.person,
                          size: 30, color: Colors.indigoAccent),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Welcome!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "ShopLazy",
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading:
                    const Icon(Icons.logout, color: Colors.redAccent),
                    title: const Text("Logout"),
                    onTap: () {
                      // handle logout
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

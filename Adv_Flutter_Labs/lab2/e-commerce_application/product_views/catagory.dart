import 'package:advance_flutter_lab/lab2/e-commerce_application/product_views/clothing.dart';
import 'package:advance_flutter_lab/lab2/e-commerce_application/product_views/electrical_appliances.dart';
import 'package:advance_flutter_lab/lab2/e-commerce_application/product_views/home_appliances.dart';
import 'package:advance_flutter_lab/lab2/e-commerce_application/product_views/skinCare_products.dart';
import 'package:advance_flutter_lab/utils/import_export.dart';

class Catagory extends StatelessWidget {
  final List<dynamic> catagories;

  const Catagory({super.key, required this.catagories});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(
            height: 60,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return ElectricalAppliances();
                  },)
                  );
                },
                child: Chip(
                  label: Text(catagories[0]),
                  backgroundColor: Colors.blueAccent,
                ),
              ),
            )
          ),
          SizedBox(
              height: 60,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return HomeAppliances();
                    },)
                    );
                  },
                  child: Chip(
                    label: Text(catagories[1]),
                    backgroundColor: Colors.blueAccent,
                  ),
                ),
              )
          ),
          SizedBox(
              height: 60,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return Clothing();
                    },)
                    );
                  },
                  child: Chip(
                    label: Text(catagories[2]),
                    backgroundColor: Colors.blueAccent,
                  ),
                ),
              )
          ),
          SizedBox(
              height: 60,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return SkincareProducts();
                    },)
                    );
                  },
                  child: Chip(
                    label: Text(catagories[3]),
                    backgroundColor: Colors.blueAccent,
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }
}

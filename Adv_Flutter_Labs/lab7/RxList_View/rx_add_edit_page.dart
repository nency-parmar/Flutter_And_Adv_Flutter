import 'package:advance_flutter_lab/lab7/RxList_View/rx_list_controller.dart';
import 'package:advance_flutter_lab/utils/import_export.dart';
import 'package:get/get.dart';

class RxAddEditPage extends StatelessWidget {
  RsListController _rxController = Get.find();
  TextEditingController name = TextEditingController();
  RxAddEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add User"),
        centerTitle: true,
      ),

      body: Column(
        children: [
          TextFormField(
            controller: name,
          ),
          SizedBox(height: 20,),
          ElevatedButton(
              onPressed: () {
              _rxController.addUser(name.text);
              print(":::::::::: add page ${_rxController.list}");
              Get.back();
            }, child: Text("Add")
          )
        ],
      ),
    );
  }
}

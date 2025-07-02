import 'package:advance_flutter_lab/lab5/data_pass/data_controller_page.dart';
import 'package:advance_flutter_lab/utils/import_export.dart';
import 'package:get/get.dart';

class DisplayDataPage extends StatelessWidget {
  dynamic map;
  DisplayDataPage({super.key}){
    map = Get.arguments;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APPBAR_TITLE_OF_GETX_DATA_PASS_TITLE),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          child: ListTile(
            title: Text(map["Name"]),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(map["Age"].toString()),
                Text(map["Designation"])
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:advance_flutter_lab/lab5/data_pass/data_controller_page.dart';
import 'package:advance_flutter_lab/lab5/data_pass/display_data_page.dart';
import 'package:advance_flutter_lab/utils/import_export.dart';
import 'package:get/get.dart';

class DataViewPage extends StatelessWidget {
  DataViewPage({super.key}) {
    Get.put(DataContoller());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page from which data will be passed"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Get.defaultDialog(
                title: "This will bavigate you to another page",
                content: Text("Are you sure you want to navigate?"),
                textConfirm: BTN_TEXT_YES,
                textCancel: BTN_TEXT_NO,
                onConfirm: () {
                  Get.toNamed(NAV_DISPLAY_PAGE_VIEW , arguments: {
                    "Name": "Dhruvi",
                    "Age": "22",
                    "Designation": "Flutter Developer"
                  },);
                },
              );
            },
            child: Text("Press")),
      ),
    );
  }
}

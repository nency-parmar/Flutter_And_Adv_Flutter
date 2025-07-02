import 'package:advance_flutter_lab/lab5/getToGetBack/get_to_get_back_controller.dart';
import 'package:advance_flutter_lab/utils/import_export.dart';
import 'package:get/get.dart';


class GetToGetBackView extends StatelessWidget {
  GetToGetBackView({super.key}){
    Get.put(GetToGetBackController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APPBAR_TITLE_OF_GETX_GET_TO_GET_BACK_TITLE),
      ),
      body: Center(
        child: ElevatedButton(onPressed: () {
          Get.defaultDialog(
            title: "Navigating page to Monument Page",
            content: Text("Are you sure you want to navigate?"),
            textConfirm: BTN_TEXT_YES,
            textCancel: BTN_TEXT_NO,
            onConfirm: () {
              Get.to(MonumentView());
            },
            onCancel: () {
              Get.back();
            },
          );
        }, child: Text("Press")
        ),
      ),
    );
  }
}

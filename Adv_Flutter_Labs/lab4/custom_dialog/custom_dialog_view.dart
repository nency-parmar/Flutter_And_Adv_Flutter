import 'package:advance_flutter_lab/lab4/custom_dialog/custom_dialog_controller.dart';
import 'package:advance_flutter_lab/utils/import_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CustomDialogView extends StatelessWidget {

  CustomDialogView({super.key}){
    Get.put(CustomDialogController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APPBAR_TITLE_OF_GETX_CUSTOM_DIALOG),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Get.dialog(
                  CupertinoAlertDialog(
                    title: Text("This is my Custom Dialog"),
                    content: Text("Is this a replica of vanilla Flutter Alert Dialogue?"),
                    actions: [
                      CupertinoButton(child: Text(BTN_TEXT_YES), onPressed: () {
                        Get.to(MonumentView());
                      },),
                      CupertinoButton(child: Text(BTN_TEXT_NO), onPressed: () {
                        Get.back();
                      },)
                    ],
                  ),
                name: "IOS Alert Dialogue",
                useSafeArea: true
              );
            }, child: Text("Press")
        ),
      ),
    );
  }
}

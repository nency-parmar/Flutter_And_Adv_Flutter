import 'package:advance_flutter_lab/lab4/AlertDialogue/alert_controller.dart';
import 'package:advance_flutter_lab/utils/import_export.dart';
import 'package:get/get.dart';

class AlertDialogue extends StatelessWidget {
  AlertDialogController _controller = AlertDialogController();

  AlertDialogue({super.key}){
    Get.put(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APPBAR_TITLE_OF_GETX_ALERT_DIALOGUE),
        centerTitle: true,
      ),
      body: Center(
          child: ElevatedButton(onPressed:  () {
              Get.defaultDialog(
                title: 'This is Alert dialogue of getX',
                content: Text('Are you sure?'),
                textConfirm: BTN_TEXT_YES,
                textCancel: BTN_TEXT_NO,
                onConfirm: () {
                  Get.to(MonumentView());
                },
                onCancel: () {
                  Get.back();
                },

            );
          }, child: Text("Press"))
      ),
    );
  }
}

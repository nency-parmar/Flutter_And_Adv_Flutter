import 'package:advance_flutter_lab/lab4/AlertDialogue/alert_controller.dart';
import 'package:advance_flutter_lab/lab4/snack_bar/snack_bar_controller.dart';
import 'package:advance_flutter_lab/utils/import_export.dart';
import 'package:get/get.dart';

class SnackBarView extends StatelessWidget {
  SnackBarController _controller = SnackBarController();

  SnackBarView({super.key}){
    Get.put(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APPBAR_TITLE_OF_GETX_BOTTOM_SHEET),
        centerTitle: true,
      ),
      body: Center(
          child: ElevatedButton(
              onPressed:  () {
                Get.snackbar(
                    'This is Getx\'s Snack Bar', 'Content of SnackBar',
                  snackPosition: SnackPosition.BOTTOM
                );
              },
              child: Text("Press"))
      ),
    );
  }
}

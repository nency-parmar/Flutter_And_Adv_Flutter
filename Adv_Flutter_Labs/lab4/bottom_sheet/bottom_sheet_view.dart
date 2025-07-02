import 'package:advance_flutter_lab/lab4/AlertDialogue/alert_controller.dart';
import 'package:advance_flutter_lab/lab4/bottom_sheet/bottom_sheet_controller.dart';
import 'package:advance_flutter_lab/lab4/snack_bar/snack_bar_controller.dart';
import 'package:advance_flutter_lab/utils/import_export.dart';
import 'package:get/get.dart';

class BottomSheetView extends StatelessWidget {
  BottomSheetController _controller = BottomSheetController();

  BottomSheetView({super.key}){
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
                Get.bottomSheet(
                    Container(
                      height: 400,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Text("Item $index");
                          },
                          itemCount: 10,
                        ),
                      ),
                    ),
                  isDismissible: false,
                  // exitBottomSheetDuration: Duration(seconds: 1),
                  elevation: 10,
                 );
              },
              child: Text("Press"))
      ),
    );
  }
}

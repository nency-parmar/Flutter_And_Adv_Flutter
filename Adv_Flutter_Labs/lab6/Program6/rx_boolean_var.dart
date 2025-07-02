import 'package:advance_flutter_lab/lab6/Program6/rx_boolean_controller.dart';
import 'package:advance_flutter_lab/utils/import_export.dart';
import 'package:get/get.dart';

class RxBooleanVar extends StatelessWidget {
  RxBooleanController _controller = new RxBooleanController();
  RxBooleanVar({super.key}){
    Get.put(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Real Time"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(onPressed: () => _controller.Change(), child: Text("Press"),),
            SizedBox(height: 20,),
            Obx(() => Text(_controller.isVar.value ? "Hello" : ""),)
          ],
        ),
      ),
    );
  }
}

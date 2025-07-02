import 'package:advance_flutter_lab/lab6/Program1/demo_controller.dart';
import 'package:advance_flutter_lab/lab6/rx_variables/rx_controller.dart';
import 'package:advance_flutter_lab/utils/import_export.dart';
import 'package:get/get.dart';

class RxView extends StatelessWidget {
  RxnController _controller = RxnController();
  RxView({super.key}){
    Get.put(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rx Variables Demonstration"),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() => Text(_controller.number.toString()))
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        _controller.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

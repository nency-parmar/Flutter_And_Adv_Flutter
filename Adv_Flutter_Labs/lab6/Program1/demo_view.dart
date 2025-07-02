import 'package:advance_flutter_lab/lab6/Program1/demo_controller.dart';
import 'package:advance_flutter_lab/utils/import_export.dart';
import 'package:get/get.dart';

class DemoView extends StatelessWidget {
  DemoView({super.key}){
    Get.put(DemoController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo View of Nonreactive Variables"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(DemoController().name , style: TextStyle(fontSize: 50),),
      ),
    );
  }
}

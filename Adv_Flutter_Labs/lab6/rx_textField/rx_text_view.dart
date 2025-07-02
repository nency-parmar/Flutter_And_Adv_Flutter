import 'package:advance_flutter_lab/lab6/rx_textField/rx_text_Controller.dart';
import 'package:get/get.dart';
import 'package:advance_flutter_lab/utils/import_export.dart';

class RxTextView extends StatelessWidget {
  RxTextController _controller = new RxTextController();
  RxTextView({super.key}){
    Get.put(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change FR"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            onChanged: _controller.updateText,
          ),
          SizedBox(height: 20,),
          Obx(() => Text(_controller.inputText.toString()),)
        ],
      ),
    );
  }
}

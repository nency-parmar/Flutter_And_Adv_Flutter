import 'package:advance_flutter_lab/lab7/RxList_View/rx_add_edit_page.dart';
import 'package:advance_flutter_lab/lab7/RxList_View/rx_list_controller.dart';
import 'package:advance_flutter_lab/utils/import_export.dart';
import 'package:get/get.dart';

class RxListView extends StatelessWidget {
  RsListController _controller = new RsListController();
  RxListView({super.key}){
    Get.lazyPut(() => RsListController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APPBAR_TITLE_OF_RX_LIST_VIEW),
        centerTitle: true,
      ),
      body: GetBuilder<RsListController>(
        init: RsListController(),
        builder: (controller) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(controller.list[index].name.toString()),
              trailing: IconButton(
                onPressed: () {
                  controller.updateFavourite(index);
                },
                icon: Icon(
                  controller.list[index].isFav
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.red,
                ),
              ),
            );
          },
          itemCount: controller.list.length,
        );
      },),
      
      floatingActionButton: FloatingActionButton(
        onPressed:  () {
        Get.to(RxAddEditPage());
        print(":::::::::: User view ${_controller.list}");
      },
        child: Icon(Icons.add),
      ),
    );
  }
}

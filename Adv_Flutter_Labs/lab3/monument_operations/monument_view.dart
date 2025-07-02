import 'package:advance_flutter_lab/lab3/monument_operations/add_monument_page.dart';
import 'package:advance_flutter_lab/utils/import_export.dart';
import 'package:flutter/cupertino.dart';

class MonumentView extends StatefulWidget {
  MonumentView({super.key});

  static MonumentController monumentController = MonumentController();

  @override
  State<MonumentView> createState() => _MonumentViewState();
}

class _MonumentViewState extends State<MonumentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(APPBAR_TITLE_OF_MONUMENT_VIEW, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                  builder: (context) => AddMonumentPage(),
                ))
                    .then(
                  (value) {
                    setState(() {});
                  },
                );
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          dynamic list =
              MonumentView.monumentController.getListOfMonument()[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                  builder: (context) => AddMonumentPage(
                    index: index,
                    user: list,
                  ),
                )).then(
                  (value) {
                    setState(() {});
                  },
                );
              },
              child: Card(
                elevation: 5,
                child: Column(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.network(list[MONUMENT_URL]),
                    )),
                    Column(
                      children: [
                        Text(
                          list[MONUMENT_NAME].toString(),
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.location_on_outlined),
                            Text(
                              list[MONUMENT_PLACE].toString(),
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return CupertinoAlertDialog(
                                        title: Text("Delete Monument"),
                                        content: Text(
                                            "Are you sure you want to delete Monument?"),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                MonumentView.monumentController
                                                    .deleteMonument(index);
                                                Navigator.pop(context);
                                                setState(() {});
                                              },
                                              child: Text("YES")),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("NO")),
                                        ],
                                      );
                                    },
                                  );
                                },
                                icon: Icon(Icons.delete))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: MonumentView.monumentController.getListOfMonument().length,
      ),
    );
  }
}

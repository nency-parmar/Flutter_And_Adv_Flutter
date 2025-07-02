import 'package:advance_flutter_lab/utils/import_export.dart';

class AddMonumentPage extends StatefulWidget {
  dynamic? user;
  int? index;

  AddMonumentPage({super.key , this.user , this.index}){
    if(user != null){
      _monumentName.text = user[MONUMENT_NAME];
      _monumentPlace.text = user[MONUMENT_PLACE];
      _monumentUrl.text = user[MONUMENT_URL];
    }
  }
  TextEditingController _monumentName = TextEditingController();
  TextEditingController _monumentPlace = TextEditingController();
  TextEditingController _monumentUrl = TextEditingController();

  @override
  State<AddMonumentPage> createState() => _AddMonumentPageState();
}

class _AddMonumentPageState extends State<AddMonumentPage> {
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text(APPBAR_TITLE_OF_ADD_MONUMENT_PAGE),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              hintText: "Enter Monument Name"
            ),
            controller: widget._monumentName,
          ),
          SizedBox(height: 10,),
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                hintText: "Enter Monument Place"
            ),
            controller: widget._monumentPlace,
          ),
          SizedBox(height: 10,),
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                hintText: "Enter Url of Image of Monument"
            ),
            controller: widget._monumentUrl,
          ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: () {
            if(widget.user != null){
              widget.user[MONUMENT_NAME] = widget._monumentName.text.toString();
              widget.user[MONUMENT_PLACE] = widget._monumentPlace.text.toString();
              widget.user[MONUMENT_URL] = widget._monumentUrl.text.toString();
              MonumentView.monumentController.edit(widget.index!, widget.user);

              print(MonumentView.monumentController.getListOfMonument().toList());
              setState(() {
                Navigator.pop(context);
              });
            }
            else{
              Map<String , dynamic> map = {};
              map[MONUMENT_NAME] = widget._monumentName.text.toString();
              map[MONUMENT_PLACE] = widget._monumentPlace.text.toString();
              map[MONUMENT_URL] = widget._monumentUrl.text.toString();

              MonumentView.monumentController.addMonument(map);
              print(MonumentView.monumentController.getListOfMonument().toList());
              // SnackBar(content: Text("Monument Added"),);
              setState(() {
                Navigator.pop(context);
              });
            }

          }, child: Text(BTN_ADD_MONUMENT_TEXT)
          )
        ],
      ),
    );
  }
}

import 'package:advance_flutter_lab/utils/import_export.dart';

class StudentView extends StatefulWidget {
  StudentView({super.key});

  @override
  State<StudentView> createState() => _StudentViewState();
}

class _StudentViewState extends State<StudentView> {
  StudentController _studentController = StudentController();
  TextEditingController name = TextEditingController();
  TextEditingController enroll = TextEditingController();
  TextEditingController spi = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APPBAR_TITLE_OF_STUDENT_VIEW),
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "Enter Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)
                    )
                  ),
                  controller: name,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Enter Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16)
                      )
                  ),
                  controller: enroll,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Enter Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16)
                      )
                  ),
                  controller: spi,
                )
              ],
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: () {
            _studentController.add_student(name.text, enroll.text, spi.text);
            setState(() {

            });
          }, child: Text("ADD")),
          SizedBox(height: 20,),
          Container(
            child: Column(
              children: [
                Text(_studentController.name! , style: TextStyle(fontSize: 20),),
                Text(_studentController.enroll!, style: TextStyle(fontSize: 20),),
                Text(_studentController.spi!, style: TextStyle(fontSize: 20),),
              ],
            ),
          )
        ],
      )
    );
  }
}

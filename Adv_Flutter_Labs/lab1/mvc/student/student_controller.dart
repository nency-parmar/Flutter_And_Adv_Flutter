import 'package:advance_flutter_lab/utils/import_export.dart';

class StudentController{
  Student _student = Student();
  String? name = STUDENT_NAME;
  String? enroll = "1234";
  String? spi = "9.99";

  void add_student(String name , String enroll , String spi) {
    this.name = name;
    this.enroll = enroll;
    this.spi = spi;
    _student.addStudent(name, enroll, spi);
  }
}
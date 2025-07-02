import 'package:advance_flutter_lab/utils/import_export.dart';

class MonumentController {

  MonumentModel _monumentModel = MonumentModel();

  List<dynamic> getListOfMonument() => _monumentModel.getMonuments();

  void addMonument(monument) => _monumentModel.addMonuments(monument);

  void deleteMonument(int index) => _monumentModel.deleteMonument(index);

  void edit(int index , dynamic monument) => _monumentModel.editMonument(index, monument);

}
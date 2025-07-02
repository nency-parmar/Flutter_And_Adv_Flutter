import 'package:advance_flutter_lab/utils/import_export.dart';

class MonumentModel{
  List<Map<String , dynamic>> monuments = [
    {
      MONUMENT_NAME : "DwarikaDhish Temple",
      MONUMENT_PLACE : "Dwarka",
      MONUMENT_URL : "https://s7ap1.scene7.com/is/image/incredibleindia/dwarkadish-temple-01-attr-hero?qlt=82&ts=1726734784547"
    },
    {
      MONUMENT_NAME : "Red Fort",
      MONUMENT_PLACE : "Delhi",
      MONUMENT_URL : "https://media.istockphoto.com/id/530741074/photo/red-fort-lal-qila-with-indian-flag-delhi-india.jpg?s=612x612&w=0&k=20&c=7BTI-dgQNPPTq2yARrwIBf2yIqO4PUPX1EJY5ITIyoM="
    },
    {
      MONUMENT_NAME : "Taj Mahal",
      MONUMENT_PLACE : "Agra",
      MONUMENT_URL : "https://i.natgeofe.com/n/8eba070d-14e5-4d07-8bab-9db774029063/93080.jpg"
    },
    {
      MONUMENT_NAME : "Qutub Minar",
      MONUMENT_PLACE : "Delhi",
      MONUMENT_URL : "https://res.cloudinary.com/https-www-isango-com/image/upload/f_auto/t_m_Prod/v7682/south%20asia/india/delhi/43050.jpg"
    },
    {
      MONUMENT_NAME : "Sun Temple",
      MONUMENT_PLACE : "Konark",
      MONUMENT_URL : "https://www.drishtiias.com/images/uploads/1640860172_Sun_temple_drishti_ias_english.png"
    },
    {
      MONUMENT_NAME : "India Gate",
      MONUMENT_PLACE : "Mumbai",
      MONUMENT_URL : "https://3.imimg.com/data3/WX/RP/MY-9438223/1.jpg"
    },
  ];

  List<dynamic> getMonuments(){
    return monuments;
  }

  void addMonuments(dynamic monument){
    if(!monuments.contains(monument)){
      monuments.add(monument);
    }
  }

  void deleteMonument(int index){
    if(monuments.contains(monuments[index])){
      monuments.removeAt(index);
    }
  }

  void editMonument(int index , dynamic monument){
    if(monuments.contains(monument[index])) {
      monuments[index] = monument;
    }
  }

}
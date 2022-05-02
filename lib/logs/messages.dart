import 'package:flutter/cupertino.dart';

class Messages {
  static void getData(String text)
  {
    debugPrint("Trying To Get Data --> ( " + text + " )");
  }
  static void errorGetData(String text , String error)
  {
    debugPrint("Error Getting Data --> ( " + text + " )" + "\nError --> " + error);
  }
  static void successGetData(String text)
  {
    debugPrint("Success Getting Data --> ( " + text + " )");
  }
}
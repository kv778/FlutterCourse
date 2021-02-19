import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:excel/excel.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';

class Demo4 extends StatefulWidget {
  @override
  _Demo4State createState() => _Demo4State();
}

class _Demo4State extends State<Demo4> {

  void readFilePath() async {
    // var sResult = result.toString();
    // var bytes = File(sResult).readAsBytesSync();
    // // var excel = Excel.createExcel();
    // // or
    // var excel = Excel.decodeBytes(bytes);
    // for (var table in excel.tables.keys) {
    //   print(table);
    //   print(excel.tables[table].maxCols);
    //   print(excel.tables[table].maxRows);
    //   for (var row in excel.tables[table].rows) {
    //     print("$row");
    //   }
    // }
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

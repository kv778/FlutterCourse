import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:excel/excel.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';

class Demo2 extends StatefulWidget {
  @override
  _Demo2State createState() => _Demo2State();
}

class _Demo2State extends State<Demo2> {
  void getFile() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();
    print(result.toString());
      var sResult = result.toString();
      var bytes = File(sResult).readAsBytesSync();
      // var excel = Excel.createExcel();
      // or
      var excel = Excel.decodeBytes(bytes);
      for (var table in excel.tables.keys) {
        print(table);
        print(excel.tables[table].maxCols);
        print(excel.tables[table].maxRows);
        for (var row in excel.tables[table].rows) {
          print("$row");
        }
      }
    }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Center(
          child: FlatButton(
            color: Colors.blue,
            child: Text(
              'Pick a file',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
              ),
            ),
            onPressed: () {
              setState(() {
                getFile();
              });
            },
          ),
        ),
      ),
    );
  }
}

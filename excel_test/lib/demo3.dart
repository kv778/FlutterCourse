import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:excel/excel.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

Storage obj = Storage();

class Demo3 extends StatefulWidget {
  @override
  _Demo3State createState() => _Demo3State();
}

class _Demo3State extends State<Demo3> {
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
                obj.readData();
              });
            },
          ),
        ),
      ),
    );
  }
}

class Storage {

  Future<String> get localPath async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  Future<File> get localFile async {
    final path = await localPath;
    return File('$path/sample.xlsx');
  }

  Future<String> readData() async {
    try {
      final file = await localFile;
      String body = await file.readAsStringSync();
      print(body);
    }
    catch (e) {
      print(e);
    }
  }


}
// import 'dart:io';
// import 'package:flutter/cupertino.dart';
// import 'package:path/path.dart';
// import 'package:excel/excel.dart';
// import 'package:flutter/services.dart' show ByteData, rootBundle;
//
// void main(List<String> args) async {
//   WidgetsFlutterBinding.ensureInitialized();
//   ByteData data = await rootBundle.load("files/stock.xlsx");
//   var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
//   var excel = Excel.decodeBytes(bytes);
//   for (var table in excel.tables.keys) {
//     print(table);
//     print(excel.tables[table].maxCols);
//     print(excel.tables[table].maxRows);
//     for (var row in excel.tables[table].rows) {
//       print("$row");
//     }
//   }
//
//   // CellStyle cellStyle = CellStyle(
//   //   bold: true,
//   //   italic: true,
//   //   fontFamily: getFontFamily(FontFamily.Comic_Sans_MS),
//   // );
//   //
//   // var sheet = excel['mySheet'];
//   //
//   // var cell = sheet.cell(CellIndex.indexByString("A1"));
//   // cell.value = "Heya How are you I am fine ok goood night";
//   // cell.cellStyle = cellStyle;
//   //
//   // var cell2 = sheet.cell(CellIndex.indexByString("E5"));
//   // cell2.value = "Heya How night";
//   // cell2.cellStyle = cellStyle;
//   //
//   // /// printing cell-type
//   // print("CellType: " + cell.cellType.toString());
//   //
//   // /// Iterating and changing values to desired type
//   // for (int row = 0; row < sheet.maxRows; row++) {
//   //   sheet.row(row).forEach((cell) {
//   //     var val = cell.value; //  Value stored in the particular cell
//   //
//   //     cell.value = ' My custom Value ';
//   //   });
//   // }
//   //
//   // excel.rename("mySheet", "myRenamedNewSheet");
//   //
//   // // fromSheet should exist in order to sucessfully copy the contents
//   // excel.copy('myRenamedNewSheet', 'toSheet');
//   //
//   // excel.rename('oldSheetName', 'newSheetName');
//   //
//   // excel.delete('Sheet1');
//   //
//   // excel.unLink('sheet1');
//   //
//   // sheet = excel['sheet'];
//   //
//   // /// appending rows
//   // List<List<String>> list = List.generate(
//   //     6000, (index) => List.generate(20, (index1) => '$index $index1'));
//   //
//   // Stopwatch stopwatch = new Stopwatch()..start();
//   // list.forEach((row) {
//   //   sheet.appendRow(row);
//   // });
//   //
//   // print('doSomething() executed in ${stopwatch.elapsed}');
//   //
//   // sheet.appendRow([8]);
//   // excel.setDefaultSheet(sheet.sheetName).then((isSet) {
//   //   // isSet is bool which tells that whether the setting of default sheet is successful or not.
//   //   if (isSet) {
//   //     print("${sheet.sheetName} is set to default sheet.");
//   //   } else {
//   //     print("Unable to set ${sheet.sheetName} to default sheet.");
//   //   }
//   // });
//   //
//   // // Saving the file
//   //
//   // String outputFile = "/Users/kawal/Desktop/form1.xlsx";
//   // excel.encode().then((onValue) {
//   //   File(join(outputFile))
//   //     ..createSync(recursive: true)
//   //     ..writeAsBytesSync(onValue);
//   // });
// }
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DropzoneViewController controller1;
  DropzoneViewController controller2;
  String message1 = 'Drop something here';
  String message2 = 'Drop something here';
  bool highlighted1 = false;

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Dropzone example'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: highlighted1 ? Colors.red : Colors.transparent,
              child: Stack(
                children: [
                  buildZone1(context),
                  Center(child: Text(message1)),
                ],
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                buildZone2(context),
                Center(child: Text(message2)),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  Widget buildZone1(BuildContext context) => Builder(
    builder: (context) => DropzoneView(
      operation: DragOperation.copy,
      cursor: CursorType.grab,
      onCreated: (ctrl) => controller1 = ctrl,
      onLoaded: () => print('Zone 1 loaded'),
      onError: (ev) => print('Zone 1 error: $ev'),
      onHover: () {
        setState(() => highlighted1 = true);
        print('Zone 1 hovered');
      },
      onLeave: () {
        setState(() => highlighted1 = false);
        print('Zone 1 left');
      },
      onDrop: (ev) {
        print('Zone 1 drop: ${ev.name}');
        setState(() {
          message1 = '${ev.name} dropped';
          highlighted1 = false;
        });
      },
    ),
  );

  Widget buildZone2(BuildContext context) => Builder(
    builder: (context) => DropzoneView(
      operation: DragOperation.move,
      onCreated: (ctrl) => controller2 = ctrl,
      onLoaded: () => print('Zone 2 loaded'),
      onError: (ev) => print('Zone 2 error: $ev'),
      onHover: () => print('Zone 2 hovered'),
      onLeave: () => print('Zone 2 left'),
      onDrop: (ev) {
        print('Zone 2 drop: ${ev.name}');
        setState(() {
          message2 = '${ev.name} dropped';
        });
      },
    ),
  );
}

// import 'dart:async';
// import 'dart:html';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// enum _DragState {
//   dragging,
//   notDragging,
// }
//
// void main() => runApp(MaterialApp(
//   debugShowCheckedModeBanner: false,
//   home: Scaffold(
//     body: DropZone(),
//   ),
// ));
//
// class DropZone extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _DropZoneState();
//   }
// }
//
// class _DropZoneState extends State<StatefulWidget> {
//
//   StreamSubscription<MouseEvent> _onDragOverSubscription;
//   StreamSubscription<MouseEvent> _onDropSubscription;
//
//   final StreamController<Point<double>> _pointStreamController = new StreamController<Point<double>>.broadcast();
//   final StreamController<_DragState> _dragStateStreamController = new StreamController<_DragState>.broadcast();
//
//   @override
//   void dispose() {
//     this._onDropSubscription.cancel();
//     this._onDragOverSubscription.cancel();
//     this._pointStreamController.close();
//     this._dragStateStreamController.close();
//     super.dispose();
//   }
//
//   List<File> _files = <File>[];
//   void _onDrop(MouseEvent value) {
//     value.stopPropagation();
//     value.preventDefault();
//     _pointStreamController.sink.add(null);
//     _addFiles(value.dataTransfer.files);
//   }
//
//   void _addFiles(List<File> newFiles) {
//     this.setState(() {
//       this._files = this._files..addAll(newFiles);
//       /// TODO
//       print(this._files);
//     });
//   }
//
//   void _onDragOver(MouseEvent value) {
//     value.stopPropagation();
//     value.preventDefault();
//     this._pointStreamController.sink.add(Point<double>(value.layer.x.toDouble(), value.layer.y.toDouble()));
//     this._dragStateStreamController.sink.add(_DragState.dragging);
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     this._onDropSubscription = document.body.onDrop.listen(_onDrop);
//     this._onDragOverSubscription = document.body.onDragOver.listen(_onDragOver);
//   }
//
//   Widget _fileDrop(BuildContext context) {
//     // styling
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         height: MediaQuery.of(context).size.height - 200,
//         decoration: BoxDecoration(
//             border: Border.all(
//                 color: Color.fromRGBO(125, 125, 125, 0.7)
//             )
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return _fileDrop(context);
//   }
// }
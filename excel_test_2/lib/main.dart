// import 'dart:async';
// import 'dart:io';
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
//
// void main() {
//   runApp(
//     MaterialApp(
//       title: 'Reading and Writing Files',
//       home: FlutterDemo(storage: CounterStorage()),
//     ),
//   );
// }
//
// class CounterStorage {
//   Future<String> get _localPath async {
//     final directory = await getApplicationDocumentsDirectory();
//
//     return directory.path;
//   }
//
//   Future<File> get _localFile async {
//     final path = await _localPath;
//     print(path);
//     return File('$path/counter.txt');
//   }
//
//   Future<int> readCounter() async {
//     try {
//       final file = await _localFile;
//
//       // Read the file
//       String contents = await file.readAsString();
//
//       return int.parse(contents);
//     } catch (e) {
//       // If encountering an error, return 0
//       return 0;
//     }
//   }
//
//   Future<File> writeCounter(int counter) async {
//     final file = await _localFile;
//
//     // Write the file
//     return file.writeAsString('$counter');
//   }
// }
//
// class FlutterDemo extends StatefulWidget {
//   final CounterStorage storage;
//
//   FlutterDemo({Key key, @required this.storage}) : super(key: key);
//
//   @override
//   _FlutterDemoState createState() => _FlutterDemoState();
// }
//
// class _FlutterDemoState extends State<FlutterDemo> {
//   int _counter;
//
//   @override
//   void initState() {
//     super.initState();
//     widget.storage.readCounter().then((int value) {
//       setState(() {
//         _counter = value;
//       });
//     });
//   }
//
//   Future<File> _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//
//     // Write the variable as a string to the file.
//     return widget.storage.writeCounter(_counter);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Reading and Writing Files')),
//       body: Center(
//         child: Text(
//           'Button tapped $_counter time${_counter == 1 ? '' : 's'}.',
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FilePickerCross filePickerCross;

  String _fileString = '';
  Set<String> lastFiles;
  FileQuotaCross quota = FileQuotaCross(quota: 0, usage: 0);

  @override
  void initState() {
    FilePickerCross.listInternalFiles()
        .then((value) => setState(() => lastFiles = value.toSet()));
    FilePickerCross.quota().then((value) => setState(() => quota = value));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.blueGrey, accentColor: Colors.lightGreen),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: ListView(
          padding: EdgeInsets.all(8),
          children: <Widget>[
            Text(
              'Last files',
              style: Theme.of(context).textTheme.headline5,
            ),
            (lastFiles == null)
                ? Center(
              child: CircularProgressIndicator(),
            )
                : ListView.builder(
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => ListTile(
                leading: Text('$index.'),
                title: Text(lastFiles.toList()[index]),
                onTap: () async => setFilePicker(
                    await FilePickerCross.fromInternalPath(
                        path: lastFiles.toList()[index])),
              ),
              itemCount: lastFiles.length,
            ),
            Builder(
              builder: (context) => RaisedButton(
                onPressed: () => _selectFile(context),
                child: Text('Open File...'),
              ),
            ),
            (filePickerCross == null)
                ? Text('Open a file first, to save')
                : RaisedButton(
              onPressed: _selectSaveFile,
              child: Text('Save as...'),
            ),
            Text(
              'File system details',
              style: Theme.of(context).textTheme.headline5,
            ),
            Text('Quota: ${(quota.quota / 1e6).round()} MB'),
            Text(
                'Usage: ${(quota.usage / 1e6).round()}; Remaining: ${(quota.remaining / 1e6).round()}'),
            Text('Percentage: ${quota.relative.roundToDouble()}'),
            Text(
              'File details',
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
                'File path: ${filePickerCross?.path ?? 'unknown'} (Might cause issues on web)\n'),
            Text('File length: ${filePickerCross?.length ?? 0}\n'),
            Text('File as String: $_fileString\n'),
          ],
        ),
      ),
    );
  }

  void _selectFile(context) {
    FilePickerCross.importMultipleFromStorage().then((filePicker) {
      setFilePicker(filePicker[0]);
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('You selected ${filePicker.length} file(s).'),
      ));
    });
  }

  void _selectSaveFile() {
    filePickerCross.exportToStorage();
  }

  setFilePicker(FilePickerCross filePicker) => setState(() {
    filePickerCross = filePicker;
    print(filePickerCross.path);
    print(filePickerCross.fileName);
    print(filePickerCross.directory);
    print(filePickerCross.toUint8List());
    filePickerCross.saveToPath(path: filePickerCross.fileName);
    FilePickerCross.quota().then((value) {
      setState(() => quota = value);
    });
    lastFiles.add(filePickerCross.fileName);
    try {
      _fileString = filePickerCross.toString();
    } catch (e) {
      _fileString = 'Not a text file. Showing base64.\n\n' +
          filePickerCross.toBase64();
    }
  });
}

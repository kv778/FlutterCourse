import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/kartik.jpeg'),
              ),
              Text(
                'Kartikeya Vishnoi',
                style: TextStyle(
                  fontFamily: 'Yellowtail',
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'DSC LEAD',
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.teal[50],
                  letterSpacing: 3.5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 200,
                  height: 10,
                  child: Divider(
                    color: Colors.teal[100],
                    thickness: 2,
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: ListTile(
                    leading: Icon(
                      Icons.call,
                      color: Colors.teal[700],
                      size: 30,
                    ),
                    title: Text(
                      '+91 8087903300',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        color: Colors.teal[700],
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.teal[700],
                      size: 30,
                    ),
                    title: Text(
                      'kartik@gmail.com',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        color: Colors.teal[700],
                        fontSize: 28,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

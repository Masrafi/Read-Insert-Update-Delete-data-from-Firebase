import 'package:firebase/delete_data.dart';
import 'package:firebase/insert_data.dart';
import 'package:firebase/read_data.dart';
import 'package:firebase/update_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          "Firebase Implementation",
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 200, right: 100, left: 100),
        children: [
          RaisedButton(
            color: Colors.pink,
            child: Text(
              "Insert Data",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Insert()));
            },
          ),
          RaisedButton(
            color: Colors.pink,
            child: Text(
              "Read Data",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Read()));
            },
          ),
          RaisedButton(
            color: Colors.pink,
            child: Text(
              "Update Data",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Update()));
            },
          ),
          RaisedButton(
            color: Colors.pink,
            child: Text(
              "Delete Data",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Delete()));
            },
          ),
        ],
      ),
    );
  }
}

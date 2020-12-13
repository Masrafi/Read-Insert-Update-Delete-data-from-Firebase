import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Read extends StatefulWidget {
  @override
  _ReadState createState() => _ReadState();
}

class _ReadState extends State<Read> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text(
            "Read",
            style: TextStyle(fontSize: 30),
          ),
          centerTitle: true,
        ),
        body: StreamBuilder(
          stream: Firestore.instance.collection('Data').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Text("Connecting...");
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                DocumentSnapshot ds = snapshot.data.documents[index];
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        ds["User Name"],
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        ds["Phone Name"],
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                );
                //Text(ds["User Name"]);
              },
            );
          },
        ));
  }
}

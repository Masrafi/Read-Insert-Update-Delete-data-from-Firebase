import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Delete extends StatelessWidget {
  final db = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return
        //MaterialApp(
        //home:
        Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          "Delete",
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Column(
        //padding: EdgeInsets.all(12.0),
        children: <Widget>[
          SizedBox(height: 20.0),
          StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection('Data').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: snapshot.data.documents.map((doc) {
                      return ListTile(
                        title: Text(doc.data['User Name']),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () async {
                            await Firestore.instance
                                .collection('Data')
                                .document(doc.documentID)
                                .delete();
                            //Navigator.pop(context);
                            //Navigator.push(context, MaterialPageRoute(builder: (context)=>Second()));
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text('Delete Successful'),
                              duration: Duration(seconds: 3),
                            ));
                          },
                        ),
                      );
                    }).toList(),
                  );
                } else {
                  return SizedBox();
                }
              }),
        ],
      ),

      //),
    );
  }
}

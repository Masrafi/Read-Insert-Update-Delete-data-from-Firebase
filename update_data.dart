import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Update extends StatefulWidget {
  @override
  _UpdateState createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _controllerTwo = TextEditingController();
  DocumentSnapshot _currentDocument;

  _updateData() async {
    await db
        .collection('Data')
        .document(_currentDocument.documentID)
        .updateData(
            {'User Name': _controller.text, 'Phone Name': _controllerTwo.text});
  }

  final db = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          "Update",
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(12.0),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: TextField(
              controller: _controllerTwo,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter Title'),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter Title'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 120.0, right: 120),
            child: RaisedButton(
              child: Text('Update'),
              color: Colors.amber,
              onPressed: _updateData,
            ),
          ),
          SizedBox(height: 20.0),
          StreamBuilder<QuerySnapshot>(
              stream: db.collection('Data').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: snapshot.data.documents.map((doc) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            doc.data['User Name'] ?? 'nil',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            doc.data['Phone Name'] ?? 'nil',
                            style: TextStyle(fontSize: 20),
                          ),
                          //Text(doc.data['User Name'] ?? 'nil'),
                          RaisedButton(
                            child: Text("Edit"),
                            color: Colors.green,
                            onPressed: () async {
                              setState(() {
                                _currentDocument = doc;
                                _controller.text = doc.data['User Name'];
                                _controllerTwo.text = doc.data['Phone Name'];
                              });
                            },
                          ),
                        ],
                      )
                          /*ListTile(
                        title: Text(doc.data['User Name'] ?? 'nil'),
                        trailing: RaisedButton(
                          child: Text("Edit"),
                          color: Colors.red,
                          onPressed: () async {
                            setState(() {
                              _currentDocument = doc;
                              _controller.text = doc.data['User Name'];
                            });
                          },
                        ),
                      )*/
                          ;
                    }).toList(),
                  );
                } else {
                  return SizedBox();
                }
              }),
        ],
      ),
    );
  }
}

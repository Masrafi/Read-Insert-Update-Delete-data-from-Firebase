import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

final userRef = Firestore.instance.collection("Data");

class Insert extends StatefulWidget {
  @override
  _InsertState createState() => _InsertState();
}

class _InsertState extends State<Insert> {
  var name = TextEditingController();
  var phone = TextEditingController();
  String postId = Uuid().v4();
  bool isUploading = false;
  final _globalKey = GlobalKey<FormState>();
  creatPost({String nameM, String phone}) {
    userRef.document(postId).setData({
      "User Name": nameM,
      "Phone Name": phone,
    });
  }

  submit() {
    setState(() {
      isUploading = true;
    });
    creatPost(
      nameM: name.text,
      phone: phone.text,
    );
    print(name.text);
    print(phone.text);
    name.clear();
    phone.clear();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text(
            "Insert",
            style: TextStyle(fontSize: 30),
          ),
          centerTitle: true,
        ),
        body: Container(
          child: Form(
            key: _globalKey,
            child: ListView(
              padding: EdgeInsets.only(top: 200, left: 40, right: 40),
              children: [
                TextFormField(
                  controller: name,
                  validator: (val) {
                    if (val.isEmpty) {
                      return "Empty";
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Type your name",
                    labelText: 'User Name',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: phone,
                  validator: (val) {
                    if (val.isEmpty) {
                      return "Empty";
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Type your phone number",
                    labelText: 'Phone',
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 80, right: 80, top: 20),
                  child: RaisedButton(
                    child: Text("Submit"),
                    onPressed: () {
                      if (_globalKey.currentState.validate()) {
                        submit();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

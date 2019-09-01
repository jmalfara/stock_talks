/*
 * Post Screen
 * This screen is responsible for displaying a form to upload a post
 * */

import 'package:flutter/material.dart';

class UploadScreen extends StatefulWidget {

  const UploadScreen();

  @override
  State<StatefulWidget> createState() {
    return _UploadScreenState();
  }
}

class _UploadScreenState extends State<UploadScreen> {
  final symbolTextController = TextEditingController();
  final titleTextController = TextEditingController();
  final descriptionTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[500],
        actions: <Widget>[
          FlatButton(
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: submitPost
          ),
        ]
      ),
      body: ListView(
        children: <Widget>[
          // TODO Build a selector for this
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: symbolTextController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Symbol',
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.characters,
            )
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: titleTextController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Title',
                  hintText: "An interesting title"
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.sentences,
            )
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              child: TextField(
                controller: descriptionTextController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Description',
                    hintText: "Details about your post (optional)"
                ),
                maxLines: null,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                textCapitalization: TextCapitalization.sentences,
              )
            )
          )
        ],
      )
    );
  }

  void submitPost() {
    // TODO Hookup API
    print("Submit Post");
  }
}
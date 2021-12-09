import 'package:flutter/material.dart';

class FillDetails extends StatefulWidget {
  @override
  _FillDetailsState createState() => _FillDetailsState();
}

class _FillDetailsState extends State<FillDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Set Task"),
      ),
      body: Container(
        color: Colors.blueGrey[50],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "Title",
                      style: TextStyle(fontSize: 30, letterSpacing: 1),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      cursorColor: Colors.black,
                      cursorHeight: 20,
                      decoration: new InputDecoration(
                        filled: true,
                        fillColor: Colors.blueGrey[50],
                        hintText: 'Assign Task Title',
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 8.0, top: 8.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.white),
                          // borderRadius: new BorderRadius.circular(25.7),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: new BorderSide(color: Colors.white),
                          // borderRadius: new BorderRadius.circular(25.7),
                        ),
                        disabledBorder: UnderlineInputBorder(
                          borderSide: new BorderSide(color: Colors.white),
                          // borderRadius: new BorderRadius.circular(25.7),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Description",
                      style: TextStyle(fontSize: 30, letterSpacing: 1),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      cursorColor: Colors.black,
                      cursorHeight: 20,
                      decoration: new InputDecoration(
                        filled: true,
                        fillColor: Colors.blueGrey[50],
                        hintText: 'Fill Task Description',
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 8.0, top: 8.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.white),
                          // borderRadius: new BorderRadius.circular(25.7),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: new BorderSide(color: Colors.white),
                          // borderRadius: new BorderRadius.circular(25.7),
                        ),
                        disabledBorder: UnderlineInputBorder(
                          borderSide: new BorderSide(color: Colors.white),
                          // borderRadius: new BorderRadius.circular(25.7),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Title",
                      style: TextStyle(fontSize: 30, letterSpacing: 1),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      cursorColor: Colors.black,
                      cursorHeight: 20,
                      decoration: new InputDecoration(
                        filled: true,
                        fillColor: Colors.blueGrey[50],
                        hintText: 'Assign Task Title',
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 8.0, top: 8.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.white),
                          // borderRadius: new BorderRadius.circular(25.7),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: new BorderSide(color: Colors.white),
                          // borderRadius: new BorderRadius.circular(25.7),
                        ),
                        disabledBorder: UnderlineInputBorder(
                          borderSide: new BorderSide(color: Colors.white),
                          // borderRadius: new BorderRadius.circular(25.7),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Save"),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

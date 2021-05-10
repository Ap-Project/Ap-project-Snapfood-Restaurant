import 'package:flutter/material.dart';
import 'package:menu_list/main.dart';

class showDetails extends StatefulWidget {
  //Function changes;
  //showDetails(this.changes);

  @override
  _showDetailsState createState() => _showDetailsState();
}

class _showDetailsState extends State<showDetails> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent[700],
          elevation: 0.0,
          title: Text('Show Details'),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => {
              Navigator.pop(context),
            },
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text('Change Food Name'),
            TextField(
              decoration: InputDecoration(
                hintText: 'Edit Food Name',
                hintStyle: TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.orange[400],
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Change Price'),
            TextField(
              decoration: InputDecoration(
                hintText: 'Edit Price',
                hintStyle: TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.orange[400],
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Change Image'),
            TextField(
              decoration: InputDecoration(
                hintText: 'Edit Image',
                hintStyle: TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.orange[400],
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              color: Colors.orange[400],
              child: Text(
                'ok',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
               // widget.changes('',2,'');
              },
            ),
          ],
        ),
      ),
    );
  }
}

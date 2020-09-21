//import 'dart:js';

import 'package:flutter/material.dart';

Widget appBar(BuildContext context, String first,  String second) {
  return RichText(
      text: TextSpan(
    style: TextStyle(fontSize: 22),
    children: <TextSpan>[
      TextSpan(
          text: first,
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black54)),
      TextSpan(
          text: second,
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.brown)),
    ],
  ));
}

/*class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: <Color>[Colors.brown[500], Colors.brown[400]])),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Card(
                  color: Colors.brown,
                  child: ListTile(
                    title: Text("kaziManager"),
                    subtitle: Text('taskingSystem'),
                    leading: CircleAvatar(
                      backgroundColor: Colors.brown[400],
                    ),
                  ),
                ),
              ),
            ),
            Card(
              child: ListTile(
                  title: Text("myTasks"),
                  leading: Icon(Icons.work),
                  onTap: () {
                    Navigator.of(context).pop();
                    //Navigator.pushNamed(context, '/tasklist');
                  }),
            ),
            Card(
              child: ListTile(
                  title: Text("taskReports"),
                  leading: Icon(Icons.archive),
                  onTap: () {
                    Navigator.of(context).pop();
                    //Navigator.pushNamed(context, '/reportlist');
                  }),
            ),
          ],
        ),
      ),
    );
  }
}*/

class AppBarSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          //allows user to search for a task
        },
      ),
    );
  }
}

class AppBarBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          //allows user to search for a task
        },
      ),
    );
  }
}

Widget blueButton({BuildContext context, String label, buttonWidth} ) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 18),
    decoration: BoxDecoration(
        color: Colors.brown, borderRadius: BorderRadius.circular(30)),
    alignment: Alignment.center,
    width: buttonWidth != null ? buttonWidth :MediaQuery.of(context).size.width - 48,
    child: Text(
      label,
      style: TextStyle(color: Colors.white, fontSize: 16),
    ),
  );
}


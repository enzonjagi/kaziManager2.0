import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
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
                    subtitle: Text('taskStystem'),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/1.png"),
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
                    Navigator.pushNamed(context, '/tasklist');
                  }),
            ),
            Card(
                          child: ListTile(
                  title: Text("myReports"),
                  leading: Icon(Icons.archive),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, '/reportlist');
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class AppBarSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            //allows user to search for a task
            
            
          },),
    );
  }
}

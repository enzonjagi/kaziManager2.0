import 'package:flutter/material.dart';
import 'package:kazimanager_withauth/screens/widgets/widget.dart';
import 'package:kazimanager_withauth/services/database.dart';

import 'home/home.dart';

class UserReports extends StatefulWidget {
  @override
  _UserReportsState createState() => _UserReportsState();
}

class _UserReportsState extends State<UserReports> {
  Stream taskStream;
  bool _error = false;
  bool _getStarted = false;

  DatabaseService databaseService = new DatabaseService();

  Widget reportList() {
    if (_error) {
      return Text("Something Went Wrong");
    }
    if (_getStarted) {
      return CircularProgressIndicator();
    }
    return Container(
      child: StreamBuilder(
        stream: taskStream,
        builder: (context, snapshot) {
          return snapshot.data == null
              ? Container()
              : ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ReportTile(
                      user:
                          snapshot.data.documents[index].data()["taskName"],
                      assigned:
                          snapshot.data.documents[index].data()["taskDesc"],
                      completed:
                          snapshot.data.documents[index].data()["dateAssigned"],
                      deadlinesMet:
                          snapshot.data.documents[index].data()["taskAssignee"],
                      
                    );
                  },
                );
        },
      ),
    );
  }

  //waiting for the data from the firebaseDb
  void waitForDataGet() async {
    try {
      setState(() {
        _getStarted = true;
      });
      await databaseService.getTaskData().then((val) {
        setState(() {
          taskStream = val;
          _getStarted = false;
        });
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    waitForDataGet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context, "user", "Reports"),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        centerTitle: true,
      ),
      body: reportList(),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}

class ReportTile extends StatelessWidget {
  final String user;
  final String assigned;
  final String completed;
  final String deadlinesMet;

  ReportTile({this.user, this.assigned, this.completed, this.deadlinesMet});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height - 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.brown[200],
        ),
        margin: EdgeInsets.all(20),
        child: Stack(children: [
          Container(
            width: MediaQuery.of(context).size.width - 100,
            alignment: Alignment.center,
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Name:",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    SizedBox(
                      width: 5,
                    ),
                    Text("$user",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ],
                ),
                SizedBox(height: 8),
                Container(
                  alignment: Alignment.centerLeft ,
                  child: Text("Tasks:",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Assigned:",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    SizedBox(
                      width: 5,
                    ),
                    Text("$assigned",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ],
                ),
               
                Row(
                  children: [
                    Text("Completed:",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    SizedBox(
                      width: 5,
                    ),
                    Text("$completed",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ],
                ),
                SizedBox(height: 8),
                Container(
                  alignment: Alignment.centerLeft ,
                  child: Text("Deadlines:",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                Row(
                  children: [
                    Text("Met:",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    SizedBox(
                      width: 5,
                    ),
                    Text("$deadlinesMet",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

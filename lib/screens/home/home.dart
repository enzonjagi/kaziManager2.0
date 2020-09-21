import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kazimanager_withauth/screens/create_task.dart';
import 'package:kazimanager_withauth/screens/playTask.dart';
import 'package:kazimanager_withauth/screens/widgets/widget.dart';
import 'package:kazimanager_withauth/services/database.dart';

//dashboard
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Stream taskStream;
  bool _error = false;
  bool _getStarted = false;

  DatabaseService databaseService = new DatabaseService();

  Widget taskList() {
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
                  itemBuilder: (context, index) {
                    return TaskTile(
                      taskName:
                          snapshot.data.documents[index].data()["taskName"],
                      taskDescription:
                          snapshot.data.documents[index].data()["taskDesc"],
                      dueDate:
                          snapshot.data.documents[index].data()["dateAssigned"],
                      assignee:
                          snapshot.data.documents[index].data()["taskAssignee"],
                      taskId:
                          snapshot.data.documents[index].data()["taskId"],
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
        title: appBar(context, "kazi", "Manager"),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        centerTitle: true,
      ),
      body: taskList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreateTask(),
              ));
        },
      ),
    );
  }
}

class TaskTile extends StatelessWidget {
  final String taskName;
  final String taskDescription;
  final String dueDate;
  final String assignee;
  final String taskId;

  TaskTile(
      {this.taskName,
      this.taskDescription,
      this.dueDate,
      this.assignee,
      this.taskId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PlayTask(taskId)));
      },
      child: Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.brown[200],
          ),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Task: " + taskName,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 4),
                    /*Text(
                      "Task: " + taskDescription,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),*/
                    SizedBox(height: 4),
                    Text(
                      "Assigned: " + assignee,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Due: " + dueDate,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

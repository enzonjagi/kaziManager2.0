import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kazimanager_withauth/models/todoparts.dart';
import 'package:kazimanager_withauth/screens/home/home.dart';
import 'package:kazimanager_withauth/screens/taskresults.dart';
import 'package:kazimanager_withauth/screens/widgets/taskWidget.dart';
import 'package:kazimanager_withauth/screens/widgets/widget.dart';
import 'package:kazimanager_withauth/services/database.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class PlayTask extends StatefulWidget {
  final String taskId;

  PlayTask(this.taskId);

  @override
  _PlayTaskState createState() => _PlayTaskState();
}

int _totalTodos = 0;
int _attempted = 0;
int _notAttempted = 0;
double _progressValue = 0;

class _PlayTaskState extends State<PlayTask> {
  DatabaseService databaseService = new DatabaseService();
  QuerySnapshot todoSnapshot;
  String taskName, taskDescription, taskAssignee, taskId, dateAssigned;

  //get the task name for the taskbar
  getTaskName() {}

  //save progress
  saveTodoProgress() {}

  //complete task
  //and save it to the report collection
  saveToTaskToReportCollection() {}

  //get data from subcollection within the task document
  TodopartsModel getTaskModelDataFromDocSnapshot(
      DocumentSnapshot taskSnapshot) {
    TodopartsModel todopartsModel = new TodopartsModel();

    //get todoName and description and assign to the todo parts model
    //todo name
    todopartsModel.todoName = taskSnapshot.data()["todoName"];

    //Todo description
    todopartsModel.todoDesc = taskSnapshot.data()["todoDesc"];

    //initiate todo status to
    todopartsModel.completed = false;

    return todopartsModel;
  }

  void getdata() async {
    await databaseService.getOneTaskData(widget.taskId).then((value) {
      todoSnapshot = value;
      _totalTodos = todoSnapshot.docs.length;
      _attempted = 0;
      _notAttempted = todoSnapshot.docs.length;
      setState(() {
        //update toDo's completed
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context, "Task: ", "Name here"),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: Colors.brown[800],
        ),
        centerTitle: true,
      ),
      body: Container(
          child: Column(children: [
        todoSnapshot == null
            ? Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Container(
                child: Center(
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: new LinearPercentIndicator(
                                width: MediaQuery.of(context).size.width - 50,
                                animation: true,
                                lineHeight: 20.0,
                                percent: 0.8,
                                center: Text("Completed: $_attempted"),
                                linearStrokeCap: LinearStrokeCap.roundAll,
                                progressColor: Colors.brown)),
                        ListView.builder(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 10),
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount: todoSnapshot.docs.length,
                            itemBuilder: (context, index) {
                              return PlayTile(
                                  todopartsModel:
                                      getTaskModelDataFromDocSnapshot(
                                          todoSnapshot.docs[index]),
                                  index: index);
                            }),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    //saves progress then pops back then adds the task to firebase
                                  },
                                  child: blueButton(
                                      context: context,
                                      label: "Complete",
                                      buttonWidth:
                                          MediaQuery.of(context).size.width /
                                                  2 -
                                              36)),
                              SizedBox(width: 24),
                              GestureDetector(
                                  onTap: () {
                                    //saves the task as it is to firebase
                                    //goes back to the home widget
                                  },
                                  child: blueButton(
                                      context: context,
                                      label: "Save",
                                      buttonWidth:
                                          MediaQuery.of(context).size.width /
                                                  2 -
                                              36)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),
              )
      ])),
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => TaskResults(
                    total: _totalTodos,
                    attempted: _attempted,
                    notattempted: _notAttempted),
              ));
        },
      ),*/
    );
  }
}

class PlayTile extends StatefulWidget {
  //initialize the task model
  final TodopartsModel todopartsModel;
  final int index;
  PlayTile({this.todopartsModel, this.index});
  @override
  _PlayTileState createState() => _PlayTileState();
}

class _PlayTileState extends State<PlayTile> {
  String todoChecked = "";
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //final String todoName, todoDesc, toDoSelected;
        GestureDetector(
          onTap: () {
            if (!widget.todopartsModel.completed) {
              todoChecked = widget.todopartsModel.todoName;
              widget.todopartsModel.completed = true;
              _attempted = _attempted + 1;
              _notAttempted = _notAttempted - 1;
              _progressValue = ((_attempted / _totalTodos) * 100);

              setState(() {
                //return _progressValue;
              });
            }
          },
          child: TodoTile(
            todoName: widget.todopartsModel.todoName,
            toDoSelected: todoChecked,
          ),
        ),
        SizedBox(height: 14),
        Text(
          "${widget.todopartsModel.todoDesc}",
          style: TextStyle(fontSize: 20, color: Colors.black54),
        ),
        SizedBox(height: 22),
      ],
    ));
  }
}

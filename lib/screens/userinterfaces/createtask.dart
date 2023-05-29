import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';
import 'package:kazimanager2/screens/task.dart';

class CreateTask extends StatefulWidget {
  @override
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final _task = Task();
  final _formKey = GlobalKey<FormState>();
  String _name, _assignee, _duedate, _description;
  String _todo1, _todo2, _todo3, _todo4, _todo5;
  //List<String> _todo = [];
  DateTime _dateTime;

  //add function(s) to post form data
  List<Task> tasks = [
    //Task(assignee: "$_assignee", )
  ];

  //todo dialog
  Future<String> createAlertDialog(BuildContext context) {
    TextEditingController customcontroller = TextEditingController();

    //returns a widget
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            title: Text("Add a todo"),
            content: TextField(
              controller: customcontroller,
              //onChanged: ,
            ),
            elevation: 24.0,
            backgroundColor: Colors.brown[200],
            actions: <Widget>[
              //passing other widgets
              FloatingActionButton(
                  child: Row(children: [
                    Text("Add todo"),
                    SizedBox(width: 5.0),
                    Icon(Icons.add_box),
                  ]),
                  onPressed: () {
                    //to post the todo data
                    //then exit the dialog
                    Navigator.of(context).pop(customcontroller.text.toString());
                  })
            ],
          );
        });
  }

  void updateTaskList(index) async {
    //add the data from the form fields
    Task instance = tasks[index];

    Navigator.pop(context, {
      'name': instance.name,
      'assignee': instance.assignee,
      'description': instance.description,
      'duedate': instance.duedate,
      'todo1': instance.todo1,
      'todo2': instance.todo2,
      'todo3': instance.todo3,
      'todo4': instance.todo4,
      'todo5': instance.todo5
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New task"),
        centerTitle: true,
        backgroundColor: Colors.brown[400],
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              //pop off this route
              Navigator.pop(context);
            }),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              //open settings
            },
            color: Colors.white12,
          ),
        ],
        elevation: 12.0,
        titleSpacing: 12,
      ),
      body: ListView(scrollDirection: Axis.vertical, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            child: Builder(
                builder: (context) => Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 12.0),
                        Text("Taskname"),
                        TextFormField(
                          initialValue: _task.name,
                          onChanged: (text) {
                            _name = text;
                          },
                        ),
                        SizedBox(height: 12.0),
                        Text("Assign to"),
                        TextFormField(
                          initialValue: _task.assignee,
                          onChanged: (text) {
                            _assignee = text;
                          },
                          //autofillHints: ,
                        ),
                        SizedBox(height: 12.0),
                        Text("Task description"),
                        TextFormField(
                          initialValue: _task.description,
                          onChanged: (text) {
                            _description = text;
                          },
                        ),
                        SizedBox(height: 12.0),
                        Card(
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 20, 5, 10),
                              child: Column(
                                children: [
                                  Text("Task Deadline"),
                                  Row(children: [
                                    Text(_dateTime == null
                                        ? 'Pick a Due date'
                                        : _duedate = _dateTime.toString()),
                                    IconButton(
                                      icon: Icon(Icons.calendar_today),
                                      onPressed: () {
                                        //open a date picker
                                        showDatePicker(
                                          context: context,
                                          initialDate: _dateTime == null
                                              ? DateTime.now()
                                              : _dateTime,
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(2099),
                                        ).then((date) {
                                          setState(() {
                                            _dateTime = date;
                                          });
                                        });
                                      },
                                    )
                                  ]),
                                ],
                              )),
                        ),
                        Card(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text("Task todo-list"),
                                  
                                  TextFormField(
                                    initialValue: _task.todo1,
                                    onChanged: (text) {
                                      _todo1 = text;
                                    },
                                  ),
                                  SizedBox(height: 2.0),
                                  TextFormField(
                                    initialValue: _task.todo2,
                                    onChanged: (text) {
                                      _todo2 = text;
                                    },
                                  ),
                                  SizedBox(height: 2.0),
                                  TextFormField(
                                    initialValue: _task.todo3,
                                    onChanged: (text) {
                                      _todo3 = text;
                                    },
                                  ),
                                  SizedBox(height: 2.0),

                                  //add a Listtile for the tasklist
                                ],
                              )),
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                //post the data using the task class
                                //display a success message
                                //
                              });
                            },
                            child: Text(
                              "Create",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ))),
          ),
        ),
        //padding ends here
      ]),
    );
  }
}

/*class TaskData {
  String taskname = "";
  String assignee = "";
  String description = "";
  String duedate = "";
  String category = " "; //to be used in comparative task reporting
  List<Todo> todo = [ ];
}*/

//TODO: create the todo widget here

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kazimanager_withauth/screens/addTodo.dart';
import 'package:kazimanager_withauth/screens/widgets/widget.dart';
import 'package:kazimanager_withauth/services/database.dart';
import 'package:random_string/random_string.dart';

class CreateTask extends StatefulWidget {

  
  @override
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  String taskName, taskDescription, taskAssignee, taskId, dateAssigned;
  final _formKey = GlobalKey<FormState>();
  //instance of the DatabaseService class that interacts with firebase
  DatabaseService databaseService = new DatabaseService();

  bool _isLoading = false;

  ///this function adds the data to firebase  
  createTaskDb() async {
    if (_formKey.currentState.validate()) {

      setState(() {
        _isLoading = true;
      });
      taskId = randomAlphaNumeric(16);

      Map<String, String> map = {
        "taskID": taskId,
        "taskName": taskName,
        "taskDesc": taskDescription,
        "taskAssignee": taskAssignee,
        "dateAssigned": dateAssigned
      };

      //waiting for the data to upload
      await databaseService.addTaskData(map, taskId).then((value) {
        setState(() {
          _isLoading = false;
        });
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddTodo(
          taskId
        )));
      } );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context, "create", "Task"),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        //leading: AppBarBack(),
      ),
      body: _isLoading
          ? Container(
              child: Center(
              child: CircularProgressIndicator(),
            ))
          : Form(
              key: _formKey,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(hintText: "Task Name"),
                        validator: (val) =>
                            val.isEmpty ? "Input Name please" : null,
                        onChanged: (val) {
                          taskName = val;
                        },
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(hintText: "Task Description"),
                        validator: (val) =>
                            val.isEmpty ? "Field is required" : null,
                        onChanged: (val) {
                          taskDescription = val;
                        },
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      TextFormField(
                        decoration: InputDecoration(hintText: "Task Assignee"),
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'Email is required';
                          }

                          if (!RegExp(
                                  "^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*")
                              .hasMatch(val)) {
                            return 'Enter a valid email address';
                          }
                        },
                        onChanged: (val) {
                          taskAssignee = val;
                        },
                      ),
                      
                      SizedBox(
                        height: 6,
                      ),
                      Card(
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 20, 5, 10),
                              child: Column(
                                children: [
                                  Text("Task Deadline"),
                                  IconButton(
                                    icon: Icon(Icons.calendar_today),
                                    onPressed: () {
                                      //open a date picker
                                      showDatePicker(
                                        context: context,
                                        initialDate: dateAssigned == null
                                            ? DateTime.now()
                                            : dateAssigned,
                                        firstDate: DateTime(2020),
                                        lastDate: DateTime(2099),
                                      ).then((date) {
                                        setState(() {
                                          dateAssigned = date.toString();
                                        });
                                      });
                                    },
                                  ),
                                ],
                              )),
                        ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          //creates a task and moves to the next screen
                          createTaskDb();
                        },
                        child: blueButton(context: context, label:"Create Task")
                      ),
                      SizedBox(height: 60)
                    ],
                  )),
            ),
    );
  }
}

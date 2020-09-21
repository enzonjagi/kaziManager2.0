import 'package:flutter/material.dart';
import 'package:kazimanager_withauth/screens/widgets/widget.dart';
import 'package:kazimanager_withauth/services/database.dart';

class AddTodo extends StatefulWidget {
  final String taskId;
  AddTodo(this.taskId);
  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  String todoName, todoDesc;
  bool _isLoading = false;
  DatabaseService databaseService = new DatabaseService();

  uploadTodoItem() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });

      Map<String, String> todoMap = {
        "todoName": todoName,
        "todoDesc": todoDesc,
      };

      await databaseService.addTodoitem(todoMap, widget.taskId).then((value) {
        setState(() {
          _isLoading = false;
        });
      });
    }
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context, "Add", "ToDo Item"),
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
                        decoration: InputDecoration(hintText: "Todo list Name"),
                        validator: (val) =>
                            val.isEmpty ? "Input Name please" : null,
                        onChanged: (val) {
                          todoName = val;
                        },
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      TextFormField(
                        decoration: InputDecoration(hintText: "To-Do description"),
                        validator: (val) =>
                            val.isEmpty ? "Field is required" : null,
                        onChanged: (val) {
                          todoDesc = val;
                        },
                      ),
                      Spacer(),
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                //completes the adding process
                                Navigator.pop(context);
                              },
                              child: blueButton(
                                  context: context,
                                  label: "Submit",
                                  buttonWidth:
                                      MediaQuery.of(context).size.width / 2 -
                                          36)),
                          SizedBox(width: 24),
                          GestureDetector(
                              onTap: () {
                                //uploads todo item to firebase 
                                uploadTodoItem();
                              },
                              child: blueButton(
                                  context: context,
                                  label: "Add toDo item",
                                  buttonWidth:
                                      MediaQuery.of(context).size.width / 2 -
                                          36)),
                        ],
                      ),
                      SizedBox(height: 60)
                    ],
                  )),
            ),
    );
  }
}

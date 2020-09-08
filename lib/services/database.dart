import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {


  //create a 'task' collection in firebase
  ///adds a collection 'task', 
  ///a random document id string'taskID'
  ///adds the map 'taskdata' to it
  ///this map has it's details defined in the createTask screen
  Future<void> addTaskData(Map taskData, String taskID) async {
    await FirebaseFirestore.instance
        .collection("Task")
        .doc(taskID)
        .set(taskData)
        .catchError((e) {
      print(e.toString());
    });
  }

  //to add a Todo item
  ///this adds a collection within the firebase document created above
  ///the collection 'todoItem' 
  ///with data 'todoData' within it
  ///the data is defined in the addTodo screen
  Future<void> addTodoitem(Map todoData, String taskID) async{
    await FirebaseFirestore.instance
    .collection("Task")
    .doc(taskID).collection("TodoItem")
    .add(todoData)
    .catchError((e){
      print(e.toString());
    });




  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  //firestore instance
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
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

  //user collection
  Future<void> addUserData(Map userData, String username) async {
    await FirebaseFirestore.instance
    .collection("Users")
    .doc(username)
    .set(userData)
    .catchError((e){
      print (e.toString());
    });
  }
  
  //check user logged in status
  

  //to add a Todo item
  ///this adds a collection within the firebase document created above
  ///the collection 'todoItem'
  ///with data 'todoData' within it
  ///the data is defined in the addTodo screen
  Future<void> addTodoitem(Map todoData, String taskID) async {
    await FirebaseFirestore.instance
        .collection("Task")
        .doc(taskID)
        .collection("TodoItem")
        .add(todoData)
        .catchError((e) {
      print(e.toString());
    });
  }

  

  //create a completed task reports colection
  /*Future<void> addTaskData(Map taskData, String taskID) async {
    await FirebaseFirestore.instance
        .collection("TaskReports")
        .doc(taskID)
        .set(taskData)
        .catchError((e) {
      print(e.toString());
    });
  }*/
  
  //getting data from the collection
  Future getTaskData() async {
    return await FirebaseFirestore.instance
    .collection("Task")
    .snapshots(includeMetadataChanges: true);
  }

  Future getOneTaskData(String taskId) async{

    return await firestore
    .collection("Task")
    .doc(taskId)
    .collection("TodoItem")
    .get();

  }

  //get data based on assignee email

}

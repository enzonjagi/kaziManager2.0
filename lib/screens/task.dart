class Task {

  //to store values of the formfield
  //and display them on the task and tasklist views
  String name;

  //assignee email
  String assignee;

  //for the date picker value
  String duedate;

  //the list of todos within a task
  String todo1;
  String todo2;
  String todo3;
  String todo4;
  String todo5;

  //description
  String description;

  //categories for tutorial only
  //remove or adjust later
  static const String CategoryFrontend = 'frontend';
  static const String CategoryBackend = 'backend';
  static const String CategoryDocumentation = 'documentation';

  Map<String, bool> categories = {
    CategoryBackend: false,
    CategoryFrontend: false,
    CategoryDocumentation: false
  };
  
  create(){
    print('saving a user using a web service');
  }
  
  //for display on the listview
  Task({
    this.name, 
    this.assignee, 
    this.duedate, 
    this.description, 
    this.todo1, 
    this.todo2, 
    this.todo3,
    this.todo4,
    this.todo5
  });

  //demonstrate calling the data from firebase
  //use this to get data from firebase later
  Future<void> getData() async{
    try{
      //get data from firebase
      //for now we'll create an instance of the data to demonstrate
      
      
    } catch(e){
      print("Error caught: $e");
      
    }
  }

  static final mockData = [
    Task(
        name: "Develop UI/UX for food app",
        assignee: "amosndungo@gmail.com",
        duedate: "23/09/2020"),
    Task(
        name: "Make a project plan",
        assignee: "enzonjagi@gmail.com",
        duedate: "23/09/2020"),
    Task(
        name: "Call africa's talking ussd api",
        assignee: "amosnjagi73@gmail.com",
        duedate: "23/09/2020"),
    Task(
        name: "Create firebase auth",
        assignee: "amosnjagi73@gmail.com",
        duedate: "23/09/2020"),
    Task(
        name: "Code flutter UI",
        assignee: "enzonjagi@gmail.com",
        duedate: "23/09/2020"),
    /*{
        'name': "Develop UI/UX for food app",
        'assignee': "amosndungo@gmail.com",
        'duedate': "23/09/2020"
        
    },
    {
        'name': "Make a project plan",
        'assignee': "enzonjagi@gmail.com",
        'duedate': "23/09/2020"
    },
    {
        'name': "Call africa's talking ussd api",
        'assignee': "amosnjagi73@gmail.com",
        'duedate': "23/09/2020"
    },
    {
        'name': "Create firebase auth",
        'assignee': "amosnjagi73@gmail.com",
        'duedate': "23/09/2020"
    },
    {
        'name': "Code flutter UI",
        'assignee': "enzonjagi@gmail.com",
        'duedate': "23/09/2020"
    },*/
  ];
  
}

class Todo {
  String value;

  Todo({this.value});
}


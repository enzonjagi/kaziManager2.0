import 'package:flutter/material.dart';
import 'package:kazimanager_withauth/screens/create_task.dart';
import 'package:kazimanager_withauth/screens/widgets/widget.dart';



//dashboard
class Home extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: appBar(context, "kazi", "Manager"),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          brightness: Brightness.light,
          centerTitle: true,
          leading: CustomDrawer(),
          actions: [
            AppBarSearch(),
          ],
        ),
        body: Container(
          child: Column(children: [

          ],)
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => CreateTask(),            
              ));
          },
        ),
        
        
    );
  }
}
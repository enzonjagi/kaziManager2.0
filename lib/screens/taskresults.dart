import 'package:flutter/material.dart';

class TaskResults extends StatefulWidget {
  final int total, attempted, notattempted;

  TaskResults({@required this.total, @required this.attempted, @required this.notattempted});
  @override
  _TaskResultsState createState() => _TaskResultsState();
}

class _TaskResultsState extends State<TaskResults> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${widget.attempted}/${widget.total}", style: TextStyle(fontSize: 25)),
            SizedBox(
              height: 8,
            ),
            Text(
                "You have attempted ${widget.attempted} ; ${widget.notattempted} more to go", style: TextStyle(fontSize: 18, color: Colors.blueGrey),),
          ],
        )),
      ),
    );
  }
}

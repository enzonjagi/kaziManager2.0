import 'package:flutter/material.dart';

class TodoTile extends StatefulWidget {
  final String todoName, toDoSelected;
  TodoTile({@required this.todoName, this.toDoSelected});
  @override
  _TodoTileState createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Row(children: [
        Container(
          height: 24,
          width: 24,
          decoration: BoxDecoration(
              border: Border.all(
                color: widget.toDoSelected == widget.todoName
                    ? Colors.green.withOpacity(0.7)
                    : Colors.grey, width: 1.5
              ),
              
              borderRadius: BorderRadius.circular(30)),
        ),
        SizedBox(width: 8),
        Text(
          "${widget.todoName}",
          style: TextStyle(fontSize: 22, color: Colors.black),
        )
      ]),
    );
  }
}

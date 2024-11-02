// ignore_for_file: must_be_immutable, sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
final bool taskCompleted;
Function(bool?)? onChanged;
Function(BuildContext)? deleteFunction;

   TodoTile( {super.key, 
   required this.taskName, 
   required this.taskCompleted,
   required this.onChanged, 
   required  this.deleteFunction,});

  @override
  Widget build(BuildContext context) {
    return (
      Padding(
        padding: EdgeInsets.all(24),
        
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion()
        
        , children: [
         SlidableAction(onPressed: deleteFunction,
         icon: Icons.delete,
         
         )
        ]),
        child: Container(
          padding: EdgeInsets.all(23.0),
          child: Row(
            children: [
              Text(taskName,
              style: TextStyle(decoration: taskCompleted 
              ?TextDecoration.lineThrough
              : TextDecoration.none,
        
              
              ),
              ),
              Checkbox(value: taskCompleted, onChanged: onChanged
              ,activeColor: Colors.black,)
            ],
          ),
          decoration: BoxDecoration(color: Colors.amber,
          borderRadius: BorderRadius.circular(12)),
          
        ),
      ),
        
        
      )
    );
   
  }
  
 
}
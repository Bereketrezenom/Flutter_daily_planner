// ignore_for_file: unused_field





import 'package:hive_flutter/hive_flutter.dart';

class Tododatabase{
     final _mybox= Hive.box("mybox");
    
       var todoList = [  ];
       

void createInitialData(){
  todoList = [ 
    ["Buy groceries",false]
      
    ];
   
}
void loadData(){
  todoList=_mybox.get(
    "TODOLIST"
  );
}
void updateData(){
_mybox.put("TODOLIST", todoList);
}
}
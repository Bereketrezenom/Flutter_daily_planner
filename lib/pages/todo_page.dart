// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/database.dart/database.dart';
import 'package:todo/util/dialog_box.dart';
import 'package:todo/util/todo_tile.dart';


class ToDoPage extends StatefulWidget {
  ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  @override
  void initState() {

    if(_mybox.get("TODOLIST")==null){
      db.createInitialData();
      
    }
    else{
      db.loadData();
    }
    // TODO: implement initState
    super.initState();
  }

    // ignore: unused_field
    final _mybox= Hive.box("mybox");

  final _controller = TextEditingController();
  Tododatabase db= Tododatabase();

  void deletetask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }

  void savenewTask() {
    setState(() {
      db.todoList.add([ _controller.text,  false]);
      _controller.clear();
    });
    Navigator.pop(context);
    db.updateData() ;
    
  }

  void createnewtask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onsave: savenewTask,
            cancel: () => Navigator.pop(context),
            
          );
        });
  }

  void checkboxchanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
      db.updateData();
  });}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 148, 155, 50),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 86, 87, 72),
          title: Text("Todo App",style: TextStyle(fontFamily:  "PermanentMarker"),),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createnewtask,
          child: Icon(
            Icons.add,
          ),
        ),
        body: ListView.builder(
          itemCount: db.todoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
              taskName: db.todoList[index][0],
              taskCompleted:db.todoList[index][1],
              onChanged: (value) => checkboxchanged(value, index),
              deleteFunction: (context) => deletetask(index),
            );
          },
        ),
      ),
    );
  }
}
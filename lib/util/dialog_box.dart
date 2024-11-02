// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';



class DialogBox extends StatelessWidget {
  VoidCallback onsave;
  VoidCallback cancel;
  final TextEditingController controller;

  DialogBox({
    super.key,
    required this.onsave,
    required this.cancel,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      title: Text('Add New Task'),
      content: Container(
        height: 150,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(labelText: "Task Name"),
            ),
            Row(
              children: [
               
                ElevatedButton(
                  onPressed: onsave,
                  child: Text("Save"),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: cancel,
                  child: Text("Cancel"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
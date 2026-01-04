import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/task_provider.dart';
import 'package:provider/provider.dart';

class Taskscreen extends StatefulWidget {
   Taskscreen({super.key});

  @override
  State<Taskscreen> createState() => _TaskscreenState();
}

class _TaskscreenState extends State<Taskscreen> {
final taskc=TextEditingController();
void dispose(){
  taskc.dispose();
}
  @override
  Widget build(BuildContext context) {
    final taskpro=(context).watch<TaskProvider>();
    return Center(
      child: Padding(padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller:taskc ,
            decoration: InputDecoration(
              labelText: 'Add New Task',
              suffixIcon: IconButton(onPressed: () {
                if(taskc.text.isNotEmpty){
                  taskpro.addtask(taskc.text);
                  taskc.clear();

                }
              }, icon: Icon(Icons.add)),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
            ),
          ),
          SizedBox(height: 20,),
          Expanded(
            child: ListView.builder(
              itemCount: taskpro.tasks.length,
              itemBuilder: (context, i) {
                final t=taskpro.tasks[i].title;
              return Card(
                child: ListTile(
                  title: Text(t),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: () {
                        taskpro.removetask(i);
                      }, icon: Icon(Icons.delete)),
                      IconButton(onPressed: () {
                        
                      }, icon: Icon(Icons.edit))
                    ],
                  ),
                ),
              );
            },),
          )
        ],
      ),
      ),
    );
  }
}
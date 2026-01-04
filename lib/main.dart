import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/task_provider.dart';
import 'package:flutter_application_1/taskscreen.dart';
import 'package:provider/provider.dart';

void main(){
  runApp( 
      ChangeNotifierProvider(
        create: (context) =>TaskProvider() ,
        child: HomeScreen()));
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 bool isdark=false;
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      theme:isdark? ThemeData.dark():ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {
              setState(() {
                isdark=!isdark;
              });
            }, icon: Icon(isdark? Icons.dark_mode:Icons.light_mode,color: Colors.white,))
          ],
          title: Text('To do app'),
          backgroundColor: Colors.deepPurple,
        ),
        body: Taskscreen(),
    
      ),
    );
  }
}
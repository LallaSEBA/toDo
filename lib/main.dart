import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:to_do_list/Ressources/ressources.dart';
import 'package:to_do_list/controller/task_controller.dart';
import 'package:to_do_list/ui/new_password.dart';
import 'ui/sign_in.dart';
import 'ui/list_tasks_screen.dart';
import 'controller/dbHelper.dart';

var pgHome;

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseHelper  db = DatabaseHelper();
  await db.readToken().then((v){
      if(global_token.trim() != '')
      pgHome = ListTaskScreen(isToday:true);
      else pgHome = SignIn();
    });
  runApp(MyApp(home:pgHome));
}

class MyApp extends StatelessWidget{
  final home;

  const MyApp({Key key, this.home}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List',
      home: home,
      debugShowCheckedModeBanner: false,
      routes: {
        '/today'    : (BuildContext context) => ListTaskScreen(isToday:true),
        '/tomorrow' : (BuildContext context) => ListTaskScreen(isToday:false),
        '/login'    : (BuildContext context) => SignIn(),
      },
    );
  }
}
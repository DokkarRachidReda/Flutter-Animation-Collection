import 'dart:async';
import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation Collection Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }

  
}



class MyHomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {  
    return Home();
  }
 

  
}


  class Home extends State<MyHomePage> with SingleTickerProviderStateMixin{


@override
  void initState() {
    super.initState();
   

  }

  @override
  Widget build(BuildContext context) {
   
  
    return Scaffold(
      
      body: Center(
      child: Padding(padding: EdgeInsets.only(left: 10),
      child: Text("Animation collection, please take a look at lib folder to find the animations that i have made",
             style: TextStyle(color: Colors.black,fontSize: 18),
      ),
      )
    ),
    );
  }
}

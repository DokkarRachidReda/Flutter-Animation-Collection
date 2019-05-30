import 'dart:async';
import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  Animation<double> animation;
  AnimationController controller;
  Tween<double> tween;
  

@override
  void initState() {
    super.initState();
   controller= new AnimationController(vsync: this,duration: Duration(milliseconds: 1100));
   tween=new Tween(begin: 0,end: 250);
   animation=tween.animate(controller);
   animation.addListener((){
        setState(() { 

        });
   });

   controller.forward();

  }

  @override
  Widget build(BuildContext context) {
   
  
    return Scaffold(
        backgroundColor: Color(0xFFeeeeee),
        
        body: Center(
          child: Container(
           decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff00bf9c),
                    
                  ),
            width: animation.value,
            height: 40,
            child: FlatButton(child: Text("Log In ",style: TextStyle(color: Colors.white),),),
        ),
        )
    );
  }
}

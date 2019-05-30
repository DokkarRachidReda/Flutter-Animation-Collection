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


  class Home extends State<MyHomePage> with TickerProviderStateMixin{
  Animation<double> animation;
  Animation<double> animation1;
  AnimationController controller;
  AnimationController controller1;
  Tween<double> tween;
  String login="";
  String pass="";
  int state=0;
  bool loginResult;
  Color btnColor=Colors.green;
  double btnWidth=280;
 
 
   

  

@override
  void initState() {
    super.initState();
   controller= new AnimationController(vsync: this,duration: Duration(milliseconds: 1500));
   controller1= new AnimationController(vsync: this,duration: Duration(milliseconds: 900));
   tween=new Tween(begin: 80,end: 280);
   animation=tween.animate(controller);
   animation1=Tween(begin: -0.6,end: -0.001).animate(CurvedAnimation(
     parent: controller1,
     curve:   Curves.fastOutSlowIn
   ));
   animation.addListener((){
        setState(() { 

        });
   });
   animation1.addListener((){
        setState(() { 

        });
   });
   
   animation.addStatusListener((s){
        if(s==AnimationStatus.completed){controller1.forward();}
   });

   controller.forward();

  }

  @override
  Widget build(BuildContext context) {
   
      double width=MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xFFeeeeee),
        
        body: Container(
           padding: EdgeInsets.only(top: 50,left: 50),
          child: Container(
            decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff00bf9c),
                    
                  ),
           
            width: animation.value + animation1.value*100,
            height: 40,
            transform: Matrix4.translationValues(animation1.value*width, 0, 0),
            child: FlatButton(child: Text("Log In "),),
        ),
        )
    );
  }


}

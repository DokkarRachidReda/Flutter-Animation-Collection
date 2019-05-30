import 'dart:async';
import 'package:flutter/material.dart';
void main() => runApp(LeftToRightTransition());

class LeftToRightTransition extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  Animation<double> animation1;
  AnimationController controller;
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
   controller= new AnimationController(vsync: this,duration: Duration(milliseconds: 3000));
   tween=new Tween(begin: 80,end: 280);
   animation=tween.animate(controller);
   animation1=Tween(begin: -0.8,end: -0.1).animate(CurvedAnimation(
     parent: controller,
     curve:  Interval(0.4, 1.0, curve: Curves.fastOutSlowIn)
   ));
   animation.addListener((){
        setState(() { 

        });
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

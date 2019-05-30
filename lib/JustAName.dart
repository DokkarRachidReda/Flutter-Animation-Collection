
import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
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
  GlobalKey key;
  String login="";
  String pass="";
  int state=0;
  bool loginResult;
  Color btnColor=Colors.green;
  double btnWidth=280;
 
   @override
  void initState() {
    super.initState();
    key=GlobalKey();
   controller= new AnimationController(vsync: this,duration: Duration(milliseconds: 2000));
   animation=Tween(begin: 0.0,end:0.1).animate(CurvedAnimation(
       curve: Curves.bounceInOut,
       parent: controller
   ));

   animation.addListener((){
        setState(() { 

        });
   });
 
  }

  @override
  Widget build(BuildContext context) {
   
      double width=MediaQuery.of(context).size.width;
      double height=MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color(0xFFeeeeee),
        body: Container(
            padding: new EdgeInsets.fromLTRB(45, 40, 50, 0) ,
            child: Column(
              children: <Widget>[

              
                new Image(
                  image:AssetImage("./assets/man.png"),
                  width:150,
                  height:180,
                  ),
                 
                
                new Padding(padding:new EdgeInsets.fromLTRB(0, 50, 10, 0) ),
                
                
                   new Container(
                    height: 40,
                    decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    
                  ),

                  alignment: Alignment.center,
                  child: new Padding(padding: new EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: new TextField(onChanged: (String str){login=str;},
                   textAlign: TextAlign.left,
                    decoration: new InputDecoration.collapsed(
                    hintText: "  username",
                    border: InputBorder.none
                ),
                ),

                  ),
                ),
                  
                new Padding(padding:new EdgeInsets.fromLTRB(0, 30, 5, 0) ),
                new Container(
                  height: 40,
                  key: key,
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),

                  alignment: Alignment.center,
                  child: new Padding(padding: new EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: new TextField(
                    onSubmitted: (String s){pass=s; controller.forward();},
                    textAlign: TextAlign.left,
                    decoration: new InputDecoration.collapsed(
                    hintText: "  password",
                    border: InputBorder.none
                ),
                ),
                  ),

                ),
                  
               new Padding(padding:new EdgeInsets.fromLTRB(0, 35, 0, 0) ),
                
               new Stack(
                 
                 children: <Widget>[
                      Row( 
                         children: <Widget>[
                           Checkbox(value: false,),
                           Text("I agree to the terms of use",),
                         ],
                         ),

                   Container(
                    decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff00bf9c),
                     ),
                    width:280, 
                    height: 40,
                    transform: Matrix4.translationValues(0, animation.value*height, 0),
                    child: FlatButton(child: Text("Log In ",style: TextStyle(color: Colors.white),)),
                     ),     
                 ],
               ),

                new Padding(padding: EdgeInsets.only(top: 100),
                child: new Text("don't Have an account ?, Register Now",
                style: TextStyle(fontSize: 10,color: Colors.black),
                ),
                )
              ],
              ),
        ),
    );
  }


}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
void main()=> runApp(new MyApp());
  class MyApp extends StatelessWidget{
    @override
    Widget build(BuildContext context){
      return new MaterialApp(
        home: new LoginPage(),
        theme: new ThemeData(
          primarySwatch: Colors.blue
        ),

      );

    }
  }
  class LoginPage extends StatefulWidget{
    @override
    LoginPageSate createState() => new LoginPageSate();
  }
  class LoginPageSate extends State<LoginPage> with SingleTickerProviderStateMixin{
    AnimationController _iconAnimationController;
    Animation<double> _iconAnimation;
    @override
    void initState(){
      super.initState();
      _iconAnimationController=new AnimationController(vsync: this,duration: new Duration(milliseconds: 500));
      _iconAnimation=new CurvedAnimation(parent: _iconAnimationController, curve: Curves.easeOut);
      _iconAnimation.addListener(()=>this.setState(() { })  );
      _iconAnimationController.forward();
    }
    @override
    Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(image: new AssetImage("assets/IMG-20200302-WA0014.jpg"),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: _iconAnimation.value *100,
              ),
              new Form(child: new Theme(
                data: new ThemeData(
                  brightness: Brightness.dark,
                  primarySwatch: Colors.teal,
                  inputDecorationTheme: new InputDecorationTheme(labelStyle: new TextStyle(
                    color: Colors.teal,
                    fontSize: 20.0
                  ))
                ),
                child: new Container(
                  padding: const EdgeInsets.all(40.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
       new TextFormField(decoration: new InputDecoration(labelText: "Enter Email",
      ),
      keyboardType: TextInputType.emailAddress,
      ),
                      new TextFormField(decoration: new InputDecoration(labelText: "Enter password",
                      ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                      new Padding(padding: const EdgeInsets.only(top: 40.0)),
                      new MaterialButton(onPressed: ()=>{},
                      color: Colors.teal,
                        height: 40.0,
                        minWidth: 60.0,
                        splashColor: Colors.deepOrange,
                      textColor: Colors.white,
                      child: new Text("Login"),)
                    ],
                  ),
                ),
              )
              )
            ],
          )

        ],

      ),

    );
  }
  }
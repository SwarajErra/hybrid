import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hybrid/Jobhomepage/JobhomePage.dart';
import 'package:hybrid/signin/SignUp.dart';
import 'package:hybrid/startedLogo/MakeChoice.dart';




class signIn extends StatefulWidget {
  const signIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<signIn> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign In',
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.green,
          title: const Text('Sign In'),
        ),
        body:SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: Container(
                      width: 200,
                      height: 150,
                      /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                      child: Image.asset('Assest/images/logoNew.png')),
                ),
              ),
              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter valid email id as abc@gmail.com'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(

                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter secure password'),
                ),
              ),
              FlatButton(
                onPressed: (){
                  //TODO SIGN UP SCREEN GOES HERE
                },
                child: Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.green, fontSize: 15),
                ),
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.green, borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => MakeChoice()));
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                height: 130,
              ),
              FlatButton(
                onPressed: (){
                 Navigator.push(
                      context, MaterialPageRoute(builder: (context) => SignUp(key: UniqueKey())));
                },
                child: Text(
                  'New user? create an account',
                  style: TextStyle(color: Colors.green, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_project2/models/user_model.dart';
import 'package:hive_project2/pages/signup_page.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hive/hive.dart';
import 'package:hive_project2/services/db_service.dart';

class LogIn extends StatefulWidget {
  static final String id = "logIn_page";
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  void _doSignin () {
  String email = emailController.text.toString().trim();
  String password = passwordController.text.toString().trim();
  var user = new User(email: email, password: password);
  HiveDB().storeUser(user);

  var user2 = HiveDB().loadUser();
  print(user2.email);
  print(user.password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: HexColor("#196a63"),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 60, left: 30),
              height: 250,
              width: double.infinity,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // user image
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("assets/images/user_2.jpg"),
                          fit: BoxFit.cover,
                        )
                    ),
                  ),
                  SizedBox(height: 30,),
                  Text("Welcome", style: TextStyle(color: Colors.tealAccent, fontSize: 20),),
                  SizedBox(height: 5,),
                  Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 30),),
                ],
              ),

            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Email", style: TextStyle(color: Colors.black, fontSize: 20,),),
                    TextField(
                    controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Enter your email",
                        labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                        hintStyle: TextStyle(fontSize: 15),
                      ),

                    ),
                    SizedBox(height:30,),
                    Text("Password", style: TextStyle(color: Colors.black, fontSize: 20),),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: "Enter your password",
                        labelStyle: TextStyle(color: Colors.black, fontSize: 25),
                        hintStyle: TextStyle(fontSize: 15),
                      ),

                    ),
                    SizedBox(height: 30,),
                    // forgot
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Text("Forgot Password ?", style: TextStyle(color: Colors.grey, fontSize: 15),),
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    // sign in button
                    Container(
                     height: 50,
                     width: double.infinity,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(20),
                       color: HexColor("#196a63"),
                     ),
                      child: FlatButton(
                        onPressed: _doSignin,
                        child: Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 20),),
                      ),
                    ),
                    SizedBox(height: 30,),
                    // or text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: new Container(
                              margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                              child: Divider(
                                color: Colors.black,
                                height: 50,
                              )),
                        ),

                        Text("OR"),

                        Expanded(
                          child: new Container(
                              margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                              child: Divider(
                                color: Colors.black,
                                height: 50,
                              )),
                        ),
                      ],
                    ),
                    // icon buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.blue.shade900,), onPressed: null),
                        SizedBox(width: 20,),
                        IconButton(icon: FaIcon(FontAwesomeIcons.twitter, color: Colors.blue,), onPressed: null),
                        SizedBox(width: 20,),
                        IconButton(icon: FaIcon(FontAwesomeIcons.instagram, color: Colors.black,), onPressed: null),
                      ],
                    ),
                    SizedBox(height: 50,),
                    // don't account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account ?"),
                      SizedBox(width: 5,),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushReplacementNamed(context, SignUp.id);
                        },
                        child: Text("Sign Up", style: TextStyle(color: Colors.blue),),
                      ),
                      SizedBox(height: 60,),
                    ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

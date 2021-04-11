import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hive_project2/models/account.dart';
import 'package:hive_project2/pages/login_page.dart';
import 'package:hive_project2/services/db_service.dart';
class SignUp extends StatefulWidget {
  static final String id = "signup_page";
  @override
  _SignUpState createState() => _SignUpState();
}
class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final addressController = TextEditingController();

 void _doSignup () {
   String email = emailController.text.toString().trim();
   String number = numberController.text.toString().trim();
   String address = addressController.text.toString().trim();
   var account = new Account(email: email, number: number, address: address);
   HiveDB().storeAccount(account);

   var account2 = HiveDB().loadAccount();
   print (account2.email);
   print (account2.number);
   print (account2.address);
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: HexColor("#196a63"),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 50, left: 30),
              height: 200,
              width: double.infinity,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Text("Welcome", style: TextStyle(color: Colors.tealAccent, fontSize: 20),),
                  SizedBox(height: 5,),
                  Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 30),),
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
                    SizedBox(height:20,),
                    Text("Number", style: TextStyle(color: Colors.black, fontSize: 20,),),
                    TextField(
                      controller: numberController,
                      decoration: InputDecoration(
                        hintText: "Enter your number",
                        labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                        hintStyle: TextStyle(fontSize: 15),
                      ),

                    ),
                    SizedBox(height: 20,),
                    Text("Address", style: TextStyle(color: Colors.black, fontSize: 20,),),
                    TextField(
                      controller: addressController,
                      decoration: InputDecoration(
                        hintText: "Enter your number",
                        labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                        hintStyle: TextStyle(fontSize: 15),
                      ),

                    ),
                    SizedBox(height: 10,),
                    // forgto password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Text("Forgot Password ?", style: TextStyle(color: Colors.grey, fontSize: 15),),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    // sign up button
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: HexColor("#196a63"),
                      ),
                      child: FlatButton(
                        onPressed: _doSignup,
                        child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 20),),
                      ),
                    ),
                    SizedBox(height: 10,),
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
                        SizedBox(width: 30,),
                        IconButton(icon: FaIcon(FontAwesomeIcons.twitter, color: Colors.blue.shade400,), onPressed: null),
                        SizedBox(width: 30,),
                        IconButton(icon: FaIcon(FontAwesomeIcons.instagram, color: Colors.black,), onPressed: null),
                      ],
                    ),
                    SizedBox(height: 30,),
                    // don't account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account ?"),
                        SizedBox(width: 5,),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushReplacementNamed(context, LogIn.id);
                          },
                          child: Text("Sign In", style: TextStyle(color: Colors.blue),),
                        ),
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

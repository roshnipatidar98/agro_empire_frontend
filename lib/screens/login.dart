
import 'dart:developer';

import 'package:agro_empire/screens/welcomeUser.dart';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import '../user.dart';




class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  MyLoginState createState() => MyLoginState();
}

class MyLoginState extends State<MyLogin> {


  bool _obscureText = true;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

final _userId = TextEditingController();
final _password = TextEditingController();

static String UserId = "";

void _logIn() async {
  UserId = _userId.text;
  var data = {
    "userId": UserId,
    "password": _password.text
  };
  var response = await CallApi().postData(data, '/signinUser');
  var bodyy = (response.body);

  if(response.statusCode == 200 || response.statusCode == 201){
    print(bodyy);
    print("login successful");
    print(response.statusCode);
    log('data: $data');

    Navigator.pop(context, 'LogIn Successfully');

    Navigator.pushAndRemoveUntil<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) =>   Userpage(),
      ),
          (route) => false,
    );

  }else{
    Navigator.pop(context, 'LogIn Faild');
  }
}

  void _toggle(){
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Widget buildUserId(){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          Text(
            'UserId',
            style:TextStyle(
              color:Colors.white,
              fontSize:16,
              fontWeight:FontWeight.bold,
              shadows: [
                Shadow(
                  blurRadius: 6,
                  color: Colors.black26,
                  offset: Offset(0,10),
                ),
              ],
            ),
          ),
          SizedBox(height:10),
          Container(
              alignment:Alignment.centerLeft,
              decoration:BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(
                      color:Colors.black26,
                      blurRadius:6,
                      offset:Offset(0,10)
                  )]
              ),

              height:60,
              child:TextFormField(
                controller: _userId,
                style:TextStyle(
                  color:Colors.black87,
                ),

                decoration:InputDecoration(
                  border:InputBorder.none,
                  contentPadding: EdgeInsets.only(top:14),
                  prefixIcon:Icon(
                    Icons.account_circle,
                    color: Color.fromARGB(200, 41, 243, 13),
                  ),

                  hintText: 'UserId',
                  hintStyle: TextStyle(
                    color:Colors.black38,
                  ),
                ),


                validator: (value){
                  if(value!.isEmpty){
                    return("UserId is Required");
                  }return null;
                },

              )
          )
        ]
    );
  }
  Widget buildPassword(){

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          Text(
            'Password',
            style:TextStyle(
              color:Colors.white,
              fontSize:16,
              fontWeight:FontWeight.bold,
              shadows: [
                Shadow(
                  blurRadius: 6,
                  color: Colors.black26,
                  offset: Offset(0,10),
                ),
              ],
            ),
          ),
          SizedBox(height:10),
          Container(
              alignment:Alignment.centerLeft,
              decoration:BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow:[BoxShadow(
                      color:Colors.black26,
                      blurRadius:6,
                      offset:Offset(0,10)
                  )]
              ),

              height:60,
              child:TextFormField(
                controller: _password,
                obscureText: _obscureText,
                obscuringCharacter: '*',
                style:TextStyle(
                  color:Colors.black87,
                ),

                decoration:InputDecoration(
                  border:InputBorder.none,
                  contentPadding: EdgeInsets.only(top:14),
                  prefixIcon:Icon(
                    Icons.lock,
                    color: Color.fromARGB(200, 41, 243, 13),
                  ),

                  suffixIcon: IconButton(
                    icon: Icon(
                      color: Color.fromARGB(200, 41, 243, 13),
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: _toggle,
                  ),

                  hintText: 'Password',
                  hintStyle: TextStyle(
                    color:Colors.black38,
                  ),
                ),


                validator: (value){
                  if(value!.isEmpty){
                    return("password is Required");
                  }return null;
                },

              )
          )
        ]
    );
  }
  Widget buildLoginBtn(){
    return Container(
      decoration: BoxDecoration(
          boxShadow:[BoxShadow(
              color:Colors.black26,
              blurRadius:6,
              offset:Offset(0,10)
          )]),

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:Color.fromARGB(150, 41, 243, 13),
          foregroundColor: Colors.white,
          fixedSize: const Size(170,50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),

        onPressed: () {
          if(_formkey.currentState!.validate())
          {
            return _logIn();
          }else{
            print("LogIn Failed");
          }
        },

        child:const Text('LogIn',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:AnnotatedRegion<SystemUiOverlayStyle>(
        value:SystemUiOverlayStyle.light,

        child: GestureDetector(

          child: Stack(

            children: <Widget>[

              Container(
                height: double.infinity,
                width: double.infinity,

                decoration: BoxDecoration(

                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end:  Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(100, 41, 243, 13),
                      Color.fromARGB(100, 38, 196, 5),
                      Color.fromARGB(100, 40, 150, 4),
                      Color.fromARGB(100, 22, 82, 2),
                    ],
                  ),
                ),

                child:SingleChildScrollView(
                  physics:AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal:25,
                    vertical: 120,
                  ),

                  child:Form(
                   key: _formkey,

                    child:Column(
                        mainAxisAlignment:MainAxisAlignment.center,
                        children:<Widget>[
                          Text(
                              'LogIn',
                              style:TextStyle(
                                color:Colors.white,
                                fontSize:40,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    blurRadius: 6,
                                    color: Colors.black26,
                                    offset: Offset(0,10),
                                  ),
                                ],
                              )
                          ),
                          SizedBox(height: 50),
                          buildUserId(),
                          SizedBox(height: 20),
                          buildPassword(),
                          SizedBox(height: 40),
                          buildLoginBtn()

                        ]
                    ),



                  ),

                ),

              ),

            ],

          ),

        ),

      ),

    );
  }

}

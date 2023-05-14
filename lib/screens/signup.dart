

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../user.dart';



class MySignup extends StatefulWidget {
   MySignup({Key? key}) : super(key: key);


  @override
  MySignupState createState() => MySignupState();
}

class MySignupState extends State<MySignup> {

  bool _obscureText = true;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final  _name = TextEditingController();
  final _parentId = TextEditingController();
  final _email = TextEditingController();
  final _mobileNo = TextEditingController();
  final _userId = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();




  @override

  static String name = "";
  static String parentId = "" ;
  static String email = "" ;
  static String mobileNo = "";
  static String userId = "";
  static String password = "";


  void _signUp() async {

    name = _name.text;
   parentId = _parentId.text;
   email = _email.text;
   mobileNo = _mobileNo.text;
   userId = _userId.text;
   password = _password.text;


   var data = {
       "parentId": parentId,
       "name": name,
       "mobileNo": mobileNo,
       "userId": userId,
       "email": email,
       "password": password
     };

     String userData = jsonEncode(data);
     print(userData);

     var response = await CallApi().postData(data, '/registerUser');
    var bodyy = (response.body);

       print(bodyy);

       if (response.statusCode == 201) {

       print(bodyy);
       print(response.statusCode);
       print('Account Created');
       log('data: $data');

       Navigator.pop(context, 'SignUp Successfully');

       Navigator.pushNamed(context, 'login');

       } else {
         Navigator.pop(context, 'SignUp Faild');
     }
 }


  void _toggle(){
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Widget buildEmail(){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          const Text(
            'Email',
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
          const SizedBox(height:10),
          Container(
              alignment:Alignment.centerLeft,
              decoration:BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow:const [BoxShadow(
                      color:Colors.black26,
                      blurRadius:6,
                      offset:Offset(0,10)
                  )]
              ),

              height:60,
              child:TextFormField(
                controller: _email,
                keyboardType:TextInputType.emailAddress,
                style:const TextStyle(
                  color:Colors.black87,
                ),

                decoration:const InputDecoration(
                  border:InputBorder.none,
                  contentPadding: EdgeInsets.only(top:14),
                  prefixIcon:Icon(
                    Icons.mail,
                    color: Color.fromARGB(200, 41, 243, 13),
                  ),

                  hintText: 'Email',
                  hintStyle: TextStyle(
                    color:Colors.black38,
                  ),
                ),

                validator: (value){
                  if(value!.isEmpty){
                    return("Email is Required");
                  }if(value.contains('@gmail.com')){
                    return null;
                  }return("Invalid Email");
                },

              )
          )
        ]
    );
  }
  Widget buildSponsorId(){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          const Text(
            'SponsorId',
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
          const SizedBox(height:10),
          Container(
              alignment:Alignment.centerLeft,
              decoration:BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow:const [BoxShadow(
                      color:Colors.black26,
                      blurRadius:6,
                      offset:Offset(0,10)
                  )]
              ),

              height:60,
              child:TextFormField(
                  controller: _parentId,
                  style:const TextStyle(
                    color:Colors.black87,
                  ),

                  decoration:const InputDecoration(
                    border:InputBorder.none,
                    contentPadding: EdgeInsets.only(top:14),
                    prefixIcon:Icon(
                      Icons.boy_rounded,
                      color: Color.fromARGB(200, 41, 243, 13),
                    ),

                    hintText: 'SponsorId',
                    hintStyle: TextStyle(
                      color:Colors.black38,
                    ),
                  )
              )
          )
        ]
    );
  }
  Widget buildName(){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          const Text(
            'Name',
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
          const SizedBox(height:10),
          Container(
              alignment:Alignment.centerLeft,
              decoration:BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow:const [BoxShadow(
                      color:Colors.black26,
                      blurRadius:6,
                      offset:Offset(0,10)
                  )]
              ),

              height:60,
              child:TextFormField(
                controller: _name,
                style:const TextStyle(
                  color:Colors.black87,
                ),

                decoration:const InputDecoration(
                  border:InputBorder.none,
                  contentPadding: EdgeInsets.only(top:14),
                  prefixIcon:Icon(
                    Icons.create,
                    color: Color.fromARGB(200, 41, 243, 13),
                  ),

                  hintText: 'Name',
                  hintStyle: TextStyle(
                    color:Colors.black38,
                  ),
                ),


                validator: (value){
                  if(value!.isEmpty){
                    return("Name is Required");
                  }return null;
                },

              )
          )
        ]
    );
  }
  Widget buildMobileNo(){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          const Text(
            'MobileNo',
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
          const SizedBox(height:10),
          Container(
              alignment:Alignment.centerLeft,
              decoration:BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow:const [BoxShadow(
                      color:Colors.black26,
                      blurRadius:6,
                      offset:Offset(0,10)
                  )]
              ),

              height:60,
              child:TextFormField(
                controller: _mobileNo,
                keyboardType:TextInputType.phone,
                style:const TextStyle(
                  color:Colors.black87,
                ),

                decoration:const InputDecoration(
                  border:InputBorder.none,
                  contentPadding: EdgeInsets.only(top:14),
                  prefixIcon:Icon(
                    Icons.phone,
                    color: Color.fromARGB(200, 41, 243, 13),
                  ),

                  hintText: 'MobileNo',
                  hintStyle: TextStyle(
                    color:Colors.black38,
                  ),
                ),


                validator: (value){
                  if(value!.isEmpty){
                    return("MobileNo is Required");
                  }if(value.isNumericOnly && value.length==10){
                    return null;
                  }return("Invalid Mobile Number");
                },

              )
          )
        ]
    );
  }
  Widget buildUserId(){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          const Text(
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
          const SizedBox(height:10),
          Container(
              alignment:Alignment.centerLeft,
              decoration:BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow:const [BoxShadow(
                      color:Colors.black26,
                      blurRadius:6,
                      offset:Offset(0,10)
                  )]
              ),

              height:60,
              child:TextFormField(
                controller: _userId,
                style:const TextStyle(
                  color:Colors.black87,
                ),

                decoration:const InputDecoration(
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
          const Text(
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
          const SizedBox(height:10),
          Container(
              alignment:Alignment.centerLeft,
              decoration:BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow:const [BoxShadow(
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
                style:const TextStyle(
                  color:Colors.black87,
                ),

                decoration:InputDecoration(
                  border:InputBorder.none,
                  contentPadding: const EdgeInsets.only(top:14),
                  prefixIcon:const Icon(
                    Icons.lock,
                    color: Color.fromARGB(200, 41, 243, 13),
                  ),

                  suffixIcon: IconButton(
                    icon: Icon(
                      color: const Color.fromARGB(200, 41, 243, 13),
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: _toggle,
                  ),

                  hintText: 'Password',
                  hintStyle: const TextStyle(
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
  Widget buildConfirmPassword(){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          const Text(
            'ConfirmPassword',
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
          const SizedBox(height:10),
          Container(
              alignment:Alignment.centerLeft,
              decoration:BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow:const [BoxShadow(
                      color:Colors.black26,
                      blurRadius:6,
                      offset:Offset(0,10)
                  )]
              ),

              height:60,
              child:TextFormField(
                controller: _confirmPassword,
                obscureText: _obscureText,
                obscuringCharacter: '*',
                style:const TextStyle(
                  color:Colors.black87,
                ),

                decoration:InputDecoration(
                  border:InputBorder.none,
                  contentPadding: const EdgeInsets.only(top:14),
                  prefixIcon:const Icon(
                    Icons.lock,
                    color: Color.fromARGB(200, 41, 243, 13),
                  ),

                  suffixIcon: IconButton(
                    icon: Icon(
                      color: const Color.fromARGB(200, 41, 243, 13),
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: _toggle,
                  ),

                  hintText: 'ConfirmPassword',
                  hintStyle: const TextStyle(
                    color:Colors.black38,
                  ),
                ),


                validator: (value){
                  if(value!.isEmpty){
                    return("please re-enter the password");
                  }if(_password.text != _confirmPassword.text){
                    return("Password dose not match");
                  }return null;
                },

              )
          )
        ]
    );
  }
  Widget buildSignupbtn(){
    return Container(
      decoration: const BoxDecoration(
          boxShadow:[BoxShadow(
              color:Colors.black26,
              blurRadius:6,
              offset:Offset(0,10)
          )]),

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(150, 41, 243, 13),
          foregroundColor: Colors.white,
          fixedSize: const Size(170,50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),

        onPressed: () async {
          if(_formkey.currentState!.validate()){
            return _signUp();
          }else{
            print("SignUp Failed");
          }
        },

        child:const Text('Submit',
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

                decoration: const BoxDecoration(

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
                  physics:const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal:25,
                    vertical: 120,
                  ),

                  child:Form(
                    key: _formkey,

                  child:Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children:<Widget>[
                        const Text(
                            'Create Account',
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
                        const SizedBox(height: 50),
                        buildSponsorId(),
                        const SizedBox(height: 20),
                        buildName(),
                        const SizedBox(height: 20),
                        buildMobileNo(),
                        const SizedBox(height: 20),
                        buildEmail(),
                        const SizedBox(height: 20),
                        buildUserId(),
                        const SizedBox(height: 20),
                        buildPassword(),
                        const SizedBox(height: 20),
                        buildConfirmPassword(),
                        const SizedBox(height: 40),
                        buildSignupbtn(),


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







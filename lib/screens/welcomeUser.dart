import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'login.dart';


class Userpage extends StatefulWidget {
  const Userpage({Key? key}) : super(key: key);

  @override
  UserpageState  createState() => UserpageState();
}

class UserpageState extends State<Userpage> {

  Widget buildCreditBtn(){
    return  Container(

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
          fixedSize: const Size(200,50),
        ),

        onPressed: () {

        },

        child:const Text('Credit Limit',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
  Widget buildRewardsBtn(){
    return  Container(

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
          fixedSize: const Size(200,50),
        ),

          onPressed:  () {

        },

        child:const Text('Rewards',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
  Widget buildDirectTeamBtn(){
    return  Container(

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
          fixedSize: const Size(200,50),
        ),

        onPressed: () {
          Navigator.pushNamed(context, 'DirectTeam');
        },

        child:const Text('Direct Team',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
  Widget buildIndirectTeamBtn(){
    return  Container(

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
          fixedSize: const Size(200,50),
        ),

        onPressed: () {
          Navigator.pushNamed(context, 'InDirectTeam');
        },

        child:const Text('Indirect Team',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
  Widget buildStatusBtn(){
    return  Container(

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
          fixedSize: const Size(200,50),
        ),

        onPressed: () {

        },

        child:const Text('Status',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
  Widget buildLogOutBtn(){
    return  Container(

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
          fixedSize: const Size(200,50),
        ),

        onPressed: () {

          Navigator.pushAndRemoveUntil<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => const MyLogin(),
            ),
                (route) => false,
          );

        },

        child:const Text('Log Out',
          style: TextStyle(fontSize: 20),
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
                            horizontal:50,
                           vertical: 200,
                 ),


                    child: Column(
                        mainAxisAlignment:MainAxisAlignment.center,

                        children:<Widget>[
                          buildCreditBtn(),
                          const SizedBox(height: 30),
                          buildRewardsBtn(),
                          const SizedBox(height: 30),
                          buildDirectTeamBtn(),
                          const SizedBox(height: 30),
                          buildIndirectTeamBtn(),
                          const SizedBox(height: 30),
                          buildStatusBtn(),
                          const SizedBox(height: 30),
                          buildLogOutBtn(),

                        ]
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









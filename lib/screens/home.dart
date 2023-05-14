import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState  createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
   return  Scaffold(

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
                   physics:AlwaysScrollableScrollPhysics(),

                   child:  Column(
                     children: [
                       Container(
                         margin: EdgeInsets.only(top:100, right: 30),
                         padding: EdgeInsets.only(right: 10),

                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.end,

                           children: [
                             ElevatedButton(
                               style: ElevatedButton.styleFrom(
                                 backgroundColor:Color.fromARGB(150, 41, 243, 13),
                                 foregroundColor: Colors.white,
                                 fixedSize: const Size(110,50),
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(15.0),
                                 ),
                               ),

                               onPressed: () {
                                 Navigator.pushNamed(context, 'login');
                               },

                               child:const Text('LogIn',
                                 style: TextStyle(fontSize: 20),
                               ),
                             ),

                             SizedBox(width: 30),

                             ElevatedButton(
                               style: ElevatedButton.styleFrom(
                                 backgroundColor:Color.fromARGB(150, 41, 243, 13),
                                 foregroundColor: Colors.white,
                                 fixedSize: const Size(110,50),
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(15.0),
                                 ),
                               ),

                               onPressed: () {
                                 Navigator.pushNamed(context, 'signup');
                               },

                               child:const Text('SignUp',
                                 style: TextStyle(fontSize: 20),
                               ),
                             ),
                           ],

                         ),
                       ),

                       SizedBox(height: 190),

                       Center(

                         child: Container(

                           child: const Center(

                             child: Text(
                                 '   WELCOME\n          TO\nAGROEMPIRE',
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
                                     ]
                                 )
                             ),
                           ),
                         ),
                       )
                     ],
                   )
               ),
             ),
           ],

         ),

       ),

     ),

   );
  }
}

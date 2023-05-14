import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../modal/Teammodal.dart';
import '../user.dart';

class InDirectTeam extends StatefulWidget {
  const InDirectTeam({Key? key}) : super(key: key);

  @override
  State<InDirectTeam> createState() => _InDirectTeamState();
}

class _InDirectTeamState extends State<InDirectTeam> {

  List<Teammodal> teamlist = [];

  Future<List<Teammodal>> getInDirectTeam() async{


    var response = await CallApi().getData('/inDirectTeam/');
    var bodyy = jsonDecode(response.body.toString());

    if(response.statusCode==200){

      teamlist.clear();

      for(Map i in bodyy){
        teamlist.add(Teammodal.fromJson(i));
      }

      return teamlist;
    } else{
      return teamlist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(150, 41, 243, 13),
        title: const Center(child: Text('InDirect Team')),
      ),

      body:AnnotatedRegion<SystemUiOverlayStyle>(
        value:SystemUiOverlayStyle.light,

        child: GestureDetector(

          child: Stack(

            children: <Widget>[

              Container(
                  height: double.infinity,
                  width: double.infinity,

                  decoration:  const BoxDecoration(
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

                  child:Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                    child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,

                        child: FutureBuilder<List<Teammodal>>(
                          future: getInDirectTeam(),
                          builder: (context, snapShot) {

                            if (snapShot.hasData) {

                              return  SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                physics: const AlwaysScrollableScrollPhysics(),

                                child: DataTable(
                                  border: TableBorder.all(width: 1, color: Colors.black87),
                                  columns:const <DataColumn>[

                                    DataColumn(
                                      label: Text(
                                        'Sponser\nId',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            shadows: [
                                              Shadow(
                                                blurRadius: 6,
                                                color: Colors.black26,
                                                offset: Offset(0,3),
                                              ),]),
                                      ),
                                    ),

                                    DataColumn(
                                      label: Text(
                                        'Child\nId',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            shadows: [
                                              Shadow(
                                                blurRadius: 6,
                                                color: Colors.black26,
                                                offset: Offset(0,3),
                                              ),]),
                                      ),
                                    ),

                                    DataColumn(
                                      label: Text(
                                        'Child\nName',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            shadows: [
                                              Shadow(
                                                blurRadius: 6,
                                                color: Colors.black26,
                                                offset: Offset(0,3),
                                              ),]),
                                      ),
                                    ),

                                    DataColumn(
                                      label: Text(
                                        'Child\nStatus',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            shadows: [
                                              Shadow(
                                                blurRadius: 6,
                                                color: Colors.black26,
                                                offset: Offset(0,3),
                                              ),]),
                                      ),
                                    ),

                                  ],

                                  rows: snapShot.data!.map<DataRow>((e) {
                                    return DataRow(
                                      cells: <DataCell>[
                                        DataCell(Text('${e.sponsorId}',
                                          style:  const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              shadows: [
                                                Shadow(
                                                  blurRadius: 6,
                                                  color: Colors.black26,
                                                  offset: Offset(0,3),
                                                ),]),)),

                                        DataCell(
                                            Text('${e.childId}',
                                              style:  const TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  shadows: [
                                                    Shadow(
                                                      blurRadius: 6,
                                                      color: Colors.black26,
                                                      offset: Offset(0,3),
                                                    ),]),
                                            )),

                                        DataCell(Text('${e.childName}',
                                          style:  const TextStyle(
                                              fontStyle: FontStyle.italic,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              shadows: [
                                                Shadow(
                                                  blurRadius: 6,
                                                  color: Colors.black26,
                                                  offset: Offset(0,3),
                                                ),]),
                                        )),

                                        DataCell(
                                            Text('${e.childStatus}',
                                              style:   const TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  shadows: [
                                                    Shadow(
                                                      blurRadius: 6,
                                                      color: Colors.black26,
                                                      offset: Offset(0,3),
                                                    ),]),

                                            )
                                        ),

                                      ],
                                    );
                                  }).toList(),
                                ),
                              );
                            }else{
                              return const CircularProgressIndicator();
                            }
                          },
                        )
                    ),
                  )

              ),

            ],

          ),

        ),

      ),

    );

  }
}

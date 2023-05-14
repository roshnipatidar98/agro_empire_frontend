
import 'dart:convert';
import 'package:agro_empire/screens/login.dart';

import 'package:http/http.dart' as http;


class CallApi {

  final String Url = "http://localhost:8080";

  //Post

  postData(data, apiUrl) async {
    var fullUrl = Url + apiUrl;
    return await http.post(
        Uri.parse(fullUrl),
        body: jsonEncode(data),
        headers: setHeaders()
    );
  }

  setHeaders()=>{
    'Content-type':'application/json',
    'Accept':'application/json',


  };

  //Get

    getData(apiUrl) async{
      var id = MyLoginState.UserId;
      var fullUrl = Url + apiUrl + id;
      return await http.get(
        Uri.parse(fullUrl),
      );

    }
}


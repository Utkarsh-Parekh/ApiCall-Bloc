import 'dart:convert';
import 'dart:io';

import 'package:api_call_bloc/model/post_model.dart';
import 'package:http/http.dart' as http;

class ApiRepository{

  Future<UserModel> getUserDetails() async{
    const String base_url = "https://reqres.in/api/unknown";

    try{
      final response = await http.get(Uri.parse(base_url));
      print(response.body);
      switch(response.statusCode){

        case 200:
          return userModelFromJson(response.body);

        case 400:
          return throw Exception("BAD PARAMETERS");

        default:
          return throw Exception("Unable to get the data");
      }
    }
    on  SocketException catch(e){
      return throw Exception("Please check Your Network Connection");
    }
    catch(e){
      return throw Exception("ERROR!! NOT ABLE TO GET THE DATA");
    }
  }

}
import 'dart:convert';

import 'package:api_call_bloc/model/post_model.dart';
import 'package:http/http.dart' as http;

class ApiRepo{

  static Future<List<Post>> getAllPosts() async{
    List<Post> posts = [];
    const String BASE_URL = "https://jsonplaceholder.typicode.com/albums";

    var response = await http.get(Uri.parse(BASE_URL));
    var data = jsonDecode(response.body);


    try{
      if(response.statusCode == 200){
        for(Map<String,dynamic> index in data ){
          posts.add(Post.fromJson(index));
        }
        return posts;
      }
      else{
        return posts;
      }
    }
    catch(e){
      print(e.toString());
    }

    return [Post.withError("Please check Your Internet Connection")];


  }




}
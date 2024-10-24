import 'package:api_call_bloc/bloc/post_bloc.dart';
import 'package:api_call_bloc/bloc/post_event.dart';
import 'package:api_call_bloc/bloc/post_state.dart';
import 'package:api_call_bloc/screen/api_page.dart';
import 'package:api_call_bloc/screen/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'favorite_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var _currentIndex = 0;
  static const List<Widget> pages = [
    ApiPage(),
    FavoritePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(20),
        child: ClipRRect(
          borderRadius:BorderRadius.circular(20),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index){
              setState(() {
                _currentIndex = index;
              });
            },
            selectedItemColor: Colors.purple,
            backgroundColor: Colors.purple.shade50,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home),backgroundColor: Colors.blue,label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.favorite),backgroundColor: Colors.blue,label: "Favorite"),
              BottomNavigationBarItem(icon: Icon(Icons.person),backgroundColor: Colors.blue,label: "Profile"),
            ],
          
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Api Calling",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.purple,

      ),

      body:(
      Center(
        child: pages.elementAt(_currentIndex)
      )
      )
    );
  }
}

import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Stack(
        children: [
          Container(
            height: 300,
            width: 500,
            color: Colors.amber,
            child: Image.network(
                fit: BoxFit.cover,
                "https://next-images.123rf.com/index/_next/image/?url=https://assets-cdn.123rf.com/index/static/assets/top-section-bg.jpeg&w=3840&q=75"),
          ),
          const Positioned(
            left: 20,
            right: 20,
            bottom: 10,
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 30,
              child: Text("Utkarsh"),
            ),
          )
        ],
      ),
    ));
  }
}

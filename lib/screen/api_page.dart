import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/post_bloc.dart';
import '../bloc/post_event.dart';
import '../bloc/post_state.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {

  @override
  void initState() {
    context.read<PostBloc>().add(GetUsersListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PostBloc,PostState>(
          // bloc: PostBloc()..add(GetUsersListEvent()),
          builder: (context,state){
            if(state is PostLoadingState){
              return const Center(child: CircularProgressIndicator());
            }
            else if(state is PostLoadedState){
              return ListView.builder(
                  itemCount: state.postData.length,
                  itemBuilder: (context,int index){
                    return  Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("User Id :${state.postData[index].userId.toString()}"),
                          Text("Title :${state.postData[index].title.toString()}")
                        ],
                      ),
                    );
                  }
              );
            }
            else if(state is PostLoadingErrorState){
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Please check your internet connection"),
                    ElevatedButton(onPressed: () {
                       context.read<PostBloc>().add(GetUsersListEvent());
                      }, child: const Text("Try again"))
                  ],
                ),
              );

            }

            else{
              return const Center(
                child: Text("No Response"),
              );
            }


          }

      ),
    );
  }
}

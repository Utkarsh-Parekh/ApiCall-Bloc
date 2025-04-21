import 'package:api_call_bloc/bloc/post-bloc/post_event.dart';
import 'package:api_call_bloc/bloc/post-bloc/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/post-bloc/post_bloc.dart';


class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  @override
  void initState() {
    context.read<UserBloc>().add(FetchUserDetails());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state.status == Status.Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.status == Status.Error) {
            return Center(
              child: Text(state.error.toString()),
            );
          }
          if (state.userModel == null ||
              state.userModel!.data.isEmpty == true) {
            return Center(
              child: Text(state.error.toString()),
            );
          }
          return ListView.builder(
            itemCount: state.userModel!.data.length ?? 0,
            itemBuilder: (context, index) {
              return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(10),
                  color: Color(
                    int.parse(
                      "0XFF" + state.userModel!.data[index].color.substring(1),
                    ),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(state.userModel?.data[index].name ?? ""),
                      ],
                    ),
                    Text(state.userModel?.data[index].pantoneValue ?? "")
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

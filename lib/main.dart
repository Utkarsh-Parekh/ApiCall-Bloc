import 'package:api_call_bloc/bloc/login-bloc/log_in_bloc.dart';
import 'package:api_call_bloc/bloc/post-bloc/post_bloc.dart';
import 'package:api_call_bloc/repository/api_repo.dart';
import 'package:api_call_bloc/router/app-routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ApiRepository>(
          create: (context) => ApiRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => UserBloc(context.read<ApiRepository>()),
          ),

          BlocProvider(
            create: (context) => LogInBloc(),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.routes,
    );
  }
}

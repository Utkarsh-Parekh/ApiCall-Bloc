import 'package:api_call_bloc/bloc/login-bloc/log_in_bloc.dart';
import 'package:api_call_bloc/bloc/login-bloc/log_in_event.dart';
import 'package:api_call_bloc/bloc/login-bloc/log_in_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context6) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
        body: BlocConsumer<LogInBloc, LogInState>(
      listenWhen: (previous, current) =>
          previous.token != current.token && current.token != null,
      listener: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Login Successful!"),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
      },
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (state.error != null && state.token == null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    state.error!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              TextField(
                controller: emailController,
                onChanged: (value) {
                  context.read<LogInBloc>().add(EmailChangeEvent(value));
                },
                decoration: InputDecoration(
                  hintText: "Enter Your Email",
                  errorText: state.showingError! && state.emailError!.isNotEmpty
                      ? state.emailError
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide:
                        const BorderSide(color: Colors.purple, width: 1),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                onChanged: (value) {
                  context.read<LogInBloc>().add(PasswordChangeEvent(value));
                },
                decoration: InputDecoration(
                  hintText: "Enter Your Password",
                  errorText:
                      state.showingError! && state.passwordError!.isNotEmpty
                          ? state.passwordError
                          : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide:
                        const BorderSide(color: Colors.purple, width: 1),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.white),
                  onPressed: () {
                    context.read<LogInBloc>().add(LogInSuccessEvent());
                  },
                  child: state.status == Status.Loading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Text("Log In"),
                ),
              )
            ],
          ),
        );
      },
    ));
  }
}

import 'dart:async';
import 'dart:convert';

import 'package:api_call_bloc/bloc/login-bloc/log_in_event.dart';
import 'package:api_call_bloc/bloc/login-bloc/log_in_state.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  LogInBloc() : super(LogInState()) {
    on<EmailChangeEvent>(emailChangeEvent);
    on<PasswordChangeEvent>(passwordChangeEvent);
    on<LogInSuccessEvent>(logInSuccessEvent);
  }

  FutureOr<void> emailChangeEvent(
      EmailChangeEvent event, Emitter<LogInState> emit) {
    final email = event.email;

    final isValid = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(email);
    emit(state.copyWith(
      showingError: true,
        Email: email, emailError: isValid ? "" : "Please Enter Valid Email"));
  }

  FutureOr<void> passwordChangeEvent(
      PasswordChangeEvent event, Emitter<LogInState> emit) {
    final password = event.password;
    emit(state.copyWith(
      showingError: true,
        Password: password,
        passwordError:
            password.length < 5 ? "Please enter strong password" : ""));
  }

  FutureOr<void> logInSuccessEvent(
      LogInSuccessEvent event, Emitter<LogInState> emit) async {

    final isEmailValid =
    RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(state.Email!);
    final isPasswordValid = state.Password!.length >= 5;

    // If either field is invalid, show errors and don't call API
    if (!isEmailValid || !isPasswordValid) {
      emit(state.copyWith(
        emailError: !isEmailValid ? "Please Enter Valid Email" : "",
        passwordError:
        !isPasswordValid ? "Please enter strong password" : "",
        status: Status.Error,
        error: null,
        showingError: true
      ));
      return;
    }

    emit(state.copyWith(status: Status.Loading, error: null));

    try {
      const String base_url = "https://reqres.in/api/login"; // Changed to login

      final response = await http.post(
        Uri.parse(base_url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          'email': state.Email,
          'password': state.Password,
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        emit(state.copyWith(
          token: data["token"],
          status: Status.Loaded,
          error: null,
          showingError: false
        ));
      } else {
        emit(state.copyWith(
          token: null,
          status: Status.Error,
          error: data["error"],
          showingError: true
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: Status.Error,
        error: e.toString(),
        showingError: true
      ));
    }
  }

}

enum Status{
  Loading,
  Loaded,
  Error
}

class LogInState {


  final String? Email;
  final String? emailError;
  final String? Password;
  final String? passwordError;
  final String? token;
  final String? error;
  final Status? status;
  final bool showingError;
  LogInState({this.Email, this.emailError = " ", this.Password, this.passwordError = " ", this.token, this.error, this.status,this.showingError = false});



  LogInState copyWith({
    String? Email,
    String? emailError,
     String? Password,
     String? passwordError,
     String? token,
     String? error,
     Status? status,
     bool? showingError,
}){
    return LogInState(
      Email: Email ?? this.Email,
      emailError: emailError ?? this.emailError,
      Password: Password ?? this.Password,
      passwordError: passwordError ?? this.passwordError,
      token: token ?? this.token,
      error: error ?? this.error,
      status: status ?? this.status,
        showingError: showingError ?? this.showingError
    );
  }
}
import 'package:equatable/equatable.dart';

abstract class LogInEvent extends Equatable{

}

class LogInSuccessEvent extends LogInEvent{
  @override
  List<Object?> get props => [];

}

class EmailChangeEvent extends LogInEvent{
  final String email;

  EmailChangeEvent(this.email);

  @override
  List<Object?> get props => [email];

}

class PasswordChangeEvent extends LogInEvent{
  final String password;

  PasswordChangeEvent(this.password);

  @override
  List<Object?> get props => [password];

}


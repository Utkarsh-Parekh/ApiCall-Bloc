

import 'package:api_call_bloc/model/post_model.dart';
import 'package:equatable/equatable.dart';

enum Status{
  Loading,
  Loaded,
  Error
}

class UserState extends Equatable{

  final UserModel? userModel;
  final Status? status;
  final String? error;

  UserState({this.userModel, this.status,this.error});

  UserState copyWith({
    final UserModel? userModel,
    final Status? status,
    final String? error
}){
    return UserState(
      userModel: userModel ??  this.userModel,
      status: status ?? this.status,
      error: error ?? this.error
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [userModel,status,error];
}
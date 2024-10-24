


import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {}

class GetUsersListEvent extends PostEvent{
  @override
  List<Object?> get props => [];
}


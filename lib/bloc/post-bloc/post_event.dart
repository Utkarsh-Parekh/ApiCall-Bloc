

import 'package:equatable/equatable.dart';

abstract class UserEvents extends Equatable{}

class FetchUserDetails extends UserEvents{
  @override
  List<Object?> get props => [];
}
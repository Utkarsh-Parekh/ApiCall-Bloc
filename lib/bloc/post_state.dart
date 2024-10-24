

import 'package:equatable/equatable.dart';

import '../model/post_model.dart';

abstract class PostState extends Equatable{

}

class PostInitialState extends PostState{
  @override
  List<Object?> get props => [];
}

class PostLoadingState extends PostState{
  @override

  List<Object?> get props => [];

}

class PostLoadedState extends PostState{
  List<Post> postData;
  PostLoadedState({required this.postData});

  @override
  List<Object?> get props => [postData];
}

class PostLoadingErrorState extends PostState{
  String Error;
  PostLoadingErrorState({required this.Error});

  @override
  List<Object?> get props => [Error];


}
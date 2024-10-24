


import 'package:api_call_bloc/bloc/post_event.dart';
import 'package:api_call_bloc/bloc/post_state.dart';
import 'package:api_call_bloc/model/post_model.dart';
import 'package:api_call_bloc/repository/api_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvent,PostState>{
  PostBloc() : super(PostInitialState()){

    on<GetUsersListEvent>((Event,Emitter<PostState> emit) async{

      emit(PostLoadingState());
      try{
        List<Post> posts = await ApiRepo.getAllPosts();
        emit(PostLoadedState(postData: posts));
      }
      catch(e){
        emit(PostLoadingErrorState(Error:e.toString()));
      }
    });

  }




}


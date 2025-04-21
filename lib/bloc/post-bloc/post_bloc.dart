import 'dart:async';

import 'package:api_call_bloc/bloc/post-bloc/post_event.dart';
import 'package:api_call_bloc/bloc/post-bloc/post_state.dart';
import 'package:api_call_bloc/model/post_model.dart';
import 'package:api_call_bloc/repository/api_repo.dart';
import 'package:bloc/bloc.dart';

class UserBloc extends Bloc<UserEvents, UserState> {
  final ApiRepository apiRepository;

  UserBloc(this.apiRepository) : super(UserState()) {
    on<FetchUserDetails>(_fetchUserDetails);
  }

  FutureOr<void> _fetchUserDetails(
      FetchUserDetails event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: Status.Loading));
    try {
      final UserModel userModelData = await apiRepository.getUserDetails();
      emit(state.copyWith(userModel: userModelData, status: Status.Loaded));
      print(userModelData);
    } catch (e) {
      emit(
        state.copyWith(
          status: Status.Error,
          error: e.toString(),
        ),
      );
    }
  }
}

 
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notifications/BlocSelectorApi/Data/Repository/posts_repository.dart';
import 'package:notifications/BlocSelectorApi/Domain/Model/posts_model.dart';
import 'package:notifications/BlocSelectorApi/Presentation/Widget/Posts/Controller/posts_states.dart'; 

class PostsCubit extends Cubit<PostsStates> {
  PostsCubit() : super(PostsInitialState());

  List<Posts> posts = [];

  Future<void> getPosts() async {
    log('inside  the  ');
    emit(PostsLoadingState());
    try { 
      List response = await PostsRepository.getPosts();
      print('response inside of cubit $response');

      if (response != null) {
        List responseData = response;
        posts =
            List<Posts>.from(responseData.map((e) => Posts.fromJson(e)));
        emit(PostsLoadedStates(posts!));
      } else {}
    } catch (e) {
      emit(PostsErrorState(error: 'Error in cubit'));
    }
  }
}
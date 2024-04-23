import 'dart:convert';

import 'package:notifications/BlocSelectorApi/Domain/Model/posts_model.dart';

abstract class PostsStates {}

class PostsInitialState extends PostsStates {}

class PostsLoadedStates extends PostsStates {

 List<Posts> posts; 
  PostsLoadedStates(this.posts);
}

class PostsLoadingState extends PostsStates {}
 
class PostsErrorState extends PostsStates {
  final String error;
  PostsErrorState({required this.error});
  
}
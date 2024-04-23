import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:notifications/BlocSelectorApi/Domain/Model/posts_model.dart';
import 'package:notifications/BlocSelectorApi/Presentation/Widget/Posts/Controller/posts_cubit.dart';
import 'package:notifications/BlocSelectorApi/Presentation/Widget/Posts/Controller/posts_states.dart';
  
class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsState();
}

class _PostsState extends State<PostsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PostsCubit>().getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Posts')),
      body: BlocBuilder<PostsCubit, PostsStates>(
        builder: (context, state) {
          if (state is PostsLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PostsLoadedStates) {
            return BlocSelector<PostsCubit, PostsStates, List<String>>(
              selector: (state) {
          
                if (state is PostsLoadedStates) {
                           return state.posts.map((post) => post.title!).toList();
                }
                            return [];
              },
              builder: (context, titles) {
                if (titles == null) {
                  return Container(
                    child: Text('Not working'),
                  );
                } 
                return ListView.builder(
                  itemCount: titles.length,
                  itemBuilder: (context, index) {
                    final title = titles[index];
                    return ListTile(
                      title: Text(title ?? 'No title'),
                    );
                  },
                );
              },
            );
          } else {
            return Container(
              child: Text('Not working'),
            );
          }
        },
      ),
    );
  }
}



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notifications/BlocSelectorApi/Presentation/Widget/Posts/Controller/posts_cubit.dart';

List<BlocProvider> appProviders = [
  BlocProvider<PostsCubit>(create: (context) => PostsCubit()),
   
];

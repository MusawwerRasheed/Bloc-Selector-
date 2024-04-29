import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notifications/BlocSelectorApi/Presentation/Widget/Posts/Controller/posts_cubit.dart';
import 'package:notifications/WEbUI/presentation/WEBUI/Widgets/MainDashBoard/Components/Skeleton/LargeScreen/Controller/first_row_stats_states.dart';

import '../../../../WEbUI/presentation/WEBUI/Widgets/MainDashBoard/Components/Skeleton/LargeScreen/Controller/first_row_stats_cubit.dart';

List<BlocProvider> appProviders = [
  BlocProvider<PostsCubit>(create: (context) => PostsCubit()),
  BlocProvider<FirstRowStatsCubit>(create: (context) => FirstRowStatsCubit()),
];

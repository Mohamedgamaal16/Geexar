import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geexar/data/repository/articales_repo_impl.dart';
import 'package:geexar/presentation/bloc/articles_bloc/articles_bloc.dart';
import 'package:geexar/presentation/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: BlocProvider(
          create: (context) => ArticlesBloc(ArticlesRepoImpl()),
          child: HomeScreenBody(),
        ),
      )),
    );
  }
}

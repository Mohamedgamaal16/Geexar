import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geexar/presentation/view_model/articles_bloc/articles_bloc.dart';
import 'package:geexar/presentation/widgets/articales_section.dart';
import 'package:geexar/presentation/widgets/custom_text_field.dart';
import 'package:geexar/presentation/widgets/loading_widget.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final articlesBloc = context.read<ArticlesBloc>();

    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: Center(
              child: Text(
            "Search App",
            style: TextStyle(fontSize: 30, color: Color(0xFF6C3293)),
          )),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 30),
        ),
        SliverToBoxAdapter(
          child: CustomTextField(
            hintText: "write your first keyword",
            controller: articlesBloc.queryController1,
            onChanged: (value) {
              articlesBloc.debouncer.run(() {
                articlesBloc.add(
                  FetchArticles(
                    query1: articlesBloc.queryController1.text.trim(),
                    query2: articlesBloc.queryController2.text.trim(),
                  ),
                );
              });
            },
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 15),
        ),
        SliverToBoxAdapter(
          child: CustomTextField(
            hintText: "write your second keyword",
            controller: articlesBloc.queryController2,
            onChanged: (value) {
              articlesBloc.debouncer.run(() {
                articlesBloc.add(
                  FetchArticles(
                    query1: articlesBloc.queryController1.text.trim(),
                    query2: articlesBloc.queryController2.text.trim(),
                  ),
                );
              });
            },
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 15),
        ),
        SliverFillRemaining(
          child: BlocBuilder<ArticlesBloc, ArticlesState>(
            builder: (context, state) {
              if (state is ArticlesLoading) {
                return const LoadingWidget();
              } else if (state is ArticlesLoaded) {
                return ArticalesSection(articles: state.articles);
              } else if (state is ArticlesError) {
                return Center(child: Text(state.message));
              } else {
                return const Center(
                    child: Text("Start searching for articles"));
              }
            },
          ),
        ),
      ],
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geexar/data/models/article_model.dart';
import 'package:geexar/data/repository/articles_repo.dart';
import 'package:geexar/data/services/debouncer.dart';
import 'package:meta/meta.dart';

part 'articles_event.dart';
part 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  final ArticlesRepo articlesRepo;

  ArticlesBloc(this.articlesRepo) : super(ArticlesInitial()) {
    on<FetchArticles>(_onFetchArticles);
  }

  final TextEditingController queryController1 = TextEditingController();
  final TextEditingController queryController2 = TextEditingController();
  final Debouncer debouncer = Debouncer(milliseconds: 700);

  Future<void> _onFetchArticles(
    FetchArticles event,
    Emitter<ArticlesState> emit,
  ) async {
    emit(ArticlesLoading());

    try {
      List<Article> mergedArticles = [];

      if (event.query1 != null && event.query1!.isNotEmpty) {
        final result1 = await articlesRepo.fetchArticles(event.query1!);
        result1.fold((articles) => mergedArticles.addAll(articles),
            (error) => emit(ArticlesError(error)));
      }

      if (event.query2 != null && event.query2!.isNotEmpty) {
        final result2 = await articlesRepo.fetchArticles(event.query2!);
        result2.fold((articles) => mergedArticles.addAll(articles),
            (error) => emit(ArticlesError(error)));
      }

      emit(ArticlesLoaded(mergedArticles));
    } catch (e) {
      emit(ArticlesError("Failed to fetch articles."));
    }
  }

  @override
  Future<void> close() {
    queryController1.dispose();
    queryController2.dispose();
    return super.close();
  }
}

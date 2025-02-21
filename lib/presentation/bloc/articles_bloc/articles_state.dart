part of 'articles_bloc.dart';

@immutable
sealed class ArticlesState {}

final class ArticlesInitial extends ArticlesState {}

final class ArticlesLoading extends ArticlesState {}

final class ArticlesLoaded extends ArticlesState {
  final List<Article> articles;

  ArticlesLoaded(this.articles);
}

final class ArticlesError extends ArticlesState {
  final String message;

  ArticlesError(this.message);
}

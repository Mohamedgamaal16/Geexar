part of 'articles_bloc.dart';

@immutable
sealed class ArticlesEvent {}

class FetchArticles extends ArticlesEvent {
  final String? query1;
  final String? query2;

  FetchArticles({this.query1, this.query2});
}

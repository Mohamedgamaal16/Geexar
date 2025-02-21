import 'package:dartz/dartz.dart';
import 'package:geexar/data/models/article_model.dart';

abstract class ArticlesRepo {
  Future<Either<List<Article>, String>> fetchArticles(String query);
}

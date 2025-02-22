import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:geexar/data/models/article_model.dart';
import 'package:geexar/data/models/news_response_model.dart';
import 'package:geexar/data/repository/articles_repo.dart';
import 'package:geexar/data/services/exceptions.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geexar/data/services/service_locator.dart';

class ArticlesRepoImpl implements ArticlesRepo {
  final Dio dio = locator<Dio>();

  @override
  Future<Either<List<Article>, String>> fetchArticles(String query) async {
    try {
      final response = await dio.get(
        '${dotenv.env['baseUrl']}${dotenv.env['endpoint']}',
        queryParameters: {
          'q': query,
          'apiKey': dotenv.env['apiKey'],
        },
      );

      final newsResponse = NewsResponse.fromJson(response.data);

      return Left(newsResponse.articles);
    } on ServerException catch (e) {
      return Right(e.errModel.message);
    } catch (e) {
      return Right('Unexpected error: $e');
    }
  }
}

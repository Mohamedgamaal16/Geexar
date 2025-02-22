import 'package:flutter/material.dart';
import 'package:geexar/data/models/article_model.dart';
import 'package:geexar/presentation/widgets/news_card.dart';

class ArticalesSection extends StatelessWidget {
  const ArticalesSection({super.key, required this.articles});
  final List<Article> articles;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (BuildContext context, int index) {
        return NewsCard(
          article: articles[index],
        );
      },
    );
  }
}

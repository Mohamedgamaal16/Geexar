import 'package:flutter/material.dart';
import 'package:geexar/data/models/article_model.dart';
import 'package:geexar/presentation/widgets/news_card.dart';

class ArticalesSection extends StatelessWidget {
  const ArticalesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return NewsCard(
          article: Article(
              sourceId: "sourceId",
              sourceName: "sourceName",
              author: "author",
              title:
                  "titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitle",
              description: "description",
              url: "url",
              urlToImage: "urlToImage",
              publishedAt: DateTime(2023),
              content: "content"),
        );
      },
    );
  }
}

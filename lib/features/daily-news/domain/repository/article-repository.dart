import 'package:news_app/features/daily-news/domain/entities/article.dart';

import '../../../../core/resources/data-state.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticle();
  Future<List<ArticleEntity>> getSavedArticle();
  Future<void> saveArticle(ArticleEntity article);
  Future<void> removeArticle(ArticleEntity article);
}

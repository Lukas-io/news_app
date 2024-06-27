import 'package:floor/floor.dart';
import 'package:news_app/features/daily-news/data/models/article.dart';

@dao
abstract class ArticleDoa {
  @Insert()
  Future<void> insertArticle(ArticleModel article);
  @delete
  Future<void> deleteArticle(ArticleModel article);
  @Query('SELECT * FROM articles')
  Future<List<ArticleModel>> getSavedArticle();
}

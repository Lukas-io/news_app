import 'package:news_app/core/resources/data-state.dart';
import 'package:news_app/features/daily-news/data/models/article.dart';
import 'package:news_app/features/daily-news/domain/repository/article-repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticle() {
    // TODO: implement getNewsArticle
    throw UnimplementedError();
  }
}

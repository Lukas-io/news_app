import 'package:news_app/core/resources/data-state.dart';
import 'package:news_app/core/use-cases/use-case.dart';
import 'package:news_app/features/daily-news/domain/entities/article.dart';
import 'package:news_app/features/daily-news/domain/repository/article-repository.dart';

class GetArticleUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticle();
  }
}

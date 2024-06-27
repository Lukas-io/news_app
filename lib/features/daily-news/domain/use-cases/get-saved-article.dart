import 'package:news_app/core/use-cases/use-case.dart';
import 'package:news_app/features/daily-news/domain/entities/article.dart';
import 'package:news_app/features/daily-news/domain/repository/article-repository.dart';

class GetSavedArticleUseCase implements UseCase<List<ArticleEntity>, void> {
  final ArticleRepository _articleRepository;

  GetSavedArticleUseCase(this._articleRepository);

  @override
  Future<List<ArticleEntity>> call({void params}) {
    return _articleRepository.getSavedArticle();
  }
}

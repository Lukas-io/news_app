import 'package:news_app/core/use-cases/use-case.dart';
import 'package:news_app/features/daily-news/domain/entities/article.dart';
import 'package:news_app/features/daily-news/domain/repository/article-repository.dart';

class RemoveArticleUseCase implements UseCase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;

  RemoveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity? params}) {
    return _articleRepository.removeArticle(params!);
  }
}

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/article.dart';

abstract class RemoteArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? exception;

  const RemoteArticleState({this.articles, this.exception});
  @override
  List<Object> get props => [articles!, exception!];
}

class RemoteArticleLoading extends RemoteArticleState {
  const RemoteArticleLoading();
}

class RemoteArticleDone extends RemoteArticleState {
  const RemoteArticleDone(List<ArticleEntity>? articles)
      : super(articles: articles);
}

class RemoteArticleException extends RemoteArticleState {
  const RemoteArticleException(DioException exception)
      : super(exception: exception);
}

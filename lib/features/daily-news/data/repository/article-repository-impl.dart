import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/core/resources/data-state.dart';
import 'package:news_app/features/daily-news/data/data-sources/remote/news-api-services.dart';
import 'package:news_app/features/daily-news/data/models/article.dart';
import 'package:news_app/features/daily-news/domain/entities/article.dart';
import 'package:news_app/features/daily-news/domain/repository/article-repository.dart';

import '../data-sources/local/app-database.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiServices _newsApiServices;
  final AppDatabase _appDatabase;
  ArticleRepositoryImpl(this._newsApiServices, this._appDatabase);
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticle() async {
    try {
      final httpResponse = await _newsApiServices.getNewsArticle(
        apiKey: kNewsApiKey,
        country: kCountryQuery,
        category: kCategoryQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataException(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataException(e);
    }
  }

  @override
  Future<List<ArticleModel>> getSavedArticle() {
    return _appDatabase.articleDAO.getSavedArticle();
  }

  @override
  Future<void> removeArticle(ArticleEntity article) {
    return _appDatabase.articleDAO
        .deleteArticle(ArticleModel.fromEntity(article));
  }

  @override
  Future<void> saveArticle(ArticleEntity article) {
    return _appDatabase.articleDAO
        .insertArticle(ArticleModel.fromEntity(article));
  }
}

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/features/daily-news/data/data-sources/remote/news-api-services.dart';
import 'package:news_app/features/daily-news/data/repository/article-repository-impl.dart';
import 'package:news_app/features/daily-news/domain/repository/article-repository.dart';
import 'package:news_app/features/daily-news/domain/use-cases/get-article.dart';
import 'package:news_app/features/daily-news/domain/use-cases/get-saved-article.dart';
import 'package:news_app/features/daily-news/domain/use-cases/remove-article.dart';
import 'package:news_app/features/daily-news/domain/use-cases/save-article.dart';
import 'package:news_app/features/daily-news/presentation/bloc/article/local/local-article-bloc.dart';
import 'package:news_app/features/daily-news/presentation/bloc/article/remote/remote-article-bloc.dart';

import 'features/daily-news/data/data-sources/local/app-database.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
//database
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

  //dio
  sl.registerSingleton<Dio>(Dio());

  //dependencies
  sl.registerSingleton<NewsApiServices>(NewsApiServices(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl(), sl()));

  //use cases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));
  sl.registerSingleton<GetSavedArticleUseCase>(GetSavedArticleUseCase(sl()));
  sl.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(sl()));
  sl.registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(sl()));

  //Blocs
  sl.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(sl()));
  sl.registerFactory<LocalArticleBloc>(
      () => LocalArticleBloc(sl(), sl(), sl()));
}

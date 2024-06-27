import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/resources/data-state.dart';
import 'package:news_app/features/daily-news/presentation/bloc/article/remote/remote-article-event.dart';
import 'package:news_app/features/daily-news/presentation/bloc/article/remote/remote-article-state.dart';

import '../../../../domain/use-cases/get-article.dart';

class RemoteArticlesBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticlesUseCase;
  RemoteArticlesBloc(this._getArticlesUseCase)
      : super(const RemoteArticleLoading()) {
    on<GetArticles>(onGetArticles);
  }

  Future<void> onGetArticles(
      GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticlesUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticleDone(dataState.data));
    }
    if (dataState is DataException) {
      emit(RemoteArticleException(dataState.exception!));
    }
  }
}

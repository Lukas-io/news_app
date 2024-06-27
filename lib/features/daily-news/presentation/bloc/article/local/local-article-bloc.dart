import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/daily-news/domain/use-cases/get-saved-article.dart';
import 'package:news_app/features/daily-news/domain/use-cases/remove-article.dart';
import 'package:news_app/features/daily-news/domain/use-cases/save-article.dart';
import 'package:news_app/features/daily-news/presentation/bloc/article/local/local-article-event.dart';
import 'package:news_app/features/daily-news/presentation/bloc/article/local/local-article-state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;

  LocalArticleBloc(this._getSavedArticleUseCase, this._saveArticleUseCase,
      this._removeArticleUseCase)
      : super(const LocalArticleLoading()) {
    on<GetSavedArticle>(onGetSavedArticle);
    on<SaveArticle>(onSaveArticle);
    on<RemoveArticle>(onRemoveArticle);
  }

  void onGetSavedArticle(
      GetSavedArticle event, Emitter<LocalArticleState> emit) async {
    final article = await _getSavedArticleUseCase();
    emit(LocalArticleDone(article));
  }

  void onSaveArticle(
      SaveArticle saveArticle, Emitter<LocalArticleState> emit) async {
    await _saveArticleUseCase(params: saveArticle.article);
    final article = await _getSavedArticleUseCase();
    emit(LocalArticleDone(article));
  }

  void onRemoveArticle(
      RemoveArticle removeArticle, Emitter<LocalArticleState> emit) async {
    await _removeArticleUseCase(params: removeArticle.article);
    final article = await _getSavedArticleUseCase();
    emit(LocalArticleDone(article));
  }
}

import 'package:flutter/material.dart';

import '../../features/daily-news/domain/entities/article.dart';
import '../../features/daily-news/presentation/pages/article-detail/article-detail.dart';
import '../../features/daily-news/presentation/pages/home/daily-news.dart';
import '../../features/daily-news/presentation/pages/saved-article/saved-article.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const DailyNews());

      case '/ArticleDetails':
        return _materialRoute(
            ArticleDetailsView(article: settings.arguments as ArticleEntity));

      case '/SavedArticles':
        return _materialRoute(const SavedArticles());

      default:
        return _materialRoute(const DailyNews());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}

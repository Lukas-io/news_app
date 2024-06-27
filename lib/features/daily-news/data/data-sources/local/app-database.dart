import 'dart:async';

import 'package:floor/floor.dart';
import 'package:news_app/features/daily-news/data/data-sources/local/aritlcle-doa.dart';
import 'package:news_app/features/daily-news/data/models/article.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app-database.g.dart';

@Database(version: 1, entities: [ArticleModel])
abstract class AppDatabase extends FloorDatabase {
  ArticleDoa get articleDAO;
}

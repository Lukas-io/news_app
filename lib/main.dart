import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/config/theme/app-themes.dart';
import 'package:news_app/features/daily-news/presentation/bloc/article/remote/remote-article-bloc.dart';
import 'package:news_app/features/daily-news/presentation/bloc/article/remote/remote-article-event.dart';
import 'package:news_app/features/daily-news/presentation/pages/home/daily-news.dart';
import 'package:news_app/injection-container.dart';

import 'config/routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (BuildContext context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        title: 'Daily News',
        theme: theme(),
        home: const DailyNews(),
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

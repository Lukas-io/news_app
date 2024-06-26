import 'package:news_app/core/constants/constants.dart';
import 'package:retrofit/retrofit.dart';

@RestApi(baseUrl: kNewsApiBaseUrl)
abstract class NewsApiServices {}

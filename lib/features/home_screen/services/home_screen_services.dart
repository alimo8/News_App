import 'dart:developer';

import 'package:n_news_app/core/constants/constants.dart';
import 'package:n_news_app/core/networking/api_endpoints.dart';
import 'package:n_news_app/core/networking/dio_helper.dart';
import 'package:n_news_app/features/home_screen/models/top_headlines_model.dart';

class HomeScreenServices {
  getTopHeadLineArticle() async {
    try {
      final response = await DioHelper.getRequest(
        endPoint: ApiEndpoints.topHeadLinesEndPoint,
        query: {"apiKey": AppConstants.newsApiKey, "country": "us"},
      );
      if (response.statusCode == 200) {
        ArticlesModels topHeadlinesModel = ArticlesModels.fromJson(
          response.data,
        );
        log(topHeadlinesModel.totalResults.toString());
        return topHeadlinesModel;
      }
    } catch (e) {
      log(e.toString());
      return Future.error(e.toString());
    }
  }
}

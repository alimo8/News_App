import 'dart:developer';

import 'package:n_news_app/core/constants/constants.dart';
import 'package:n_news_app/core/networking/api_endpoints.dart';
import 'package:n_news_app/core/networking/dio_helper.dart';
import 'package:n_news_app/features/home_screen/models/top_headlines_model.dart';

class SearchResultServices {
  searchItemByName(String query) async {
    try {
      final response = await DioHelper.getRequest(
        endPoint: ApiEndpoints.searchEndPoint,
        query: {
          "apiKey": AppConstants.newsApiKey,
          "q": query,
          "language": 'ar',
        },
      );
      if (response.statusCode == 200) {
        ArticlesModels articlesModels = ArticlesModels.fromJson(response.data);
        log(articlesModels.totalResults.toString());
        return articlesModels;
      }
    } catch (e) {
      log(e.toString());
      return Future.error(e.toString());
    }
  }
}

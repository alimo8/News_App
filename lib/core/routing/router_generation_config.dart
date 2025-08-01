import 'package:go_router/go_router.dart';
import 'package:n_news_app/core/routing/app_routes.dart';
import 'package:n_news_app/features/home_screen/articles_details_screen.dart';
import 'package:n_news_app/features/home_screen/home_screen.dart';
import 'package:n_news_app/features/home_screen/models/top_headlines_model.dart';
import 'package:n_news_app/features/search_result_screen/search_result_screen.dart';

class RouterGenerationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.homeScreen,
    routes: [
      GoRoute(
        path: AppRoutes.homeScreen,
        name: AppRoutes.homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.searchResultScreen,
        name: AppRoutes.searchResultScreen,
        builder: (context, state) {
          final query = state.extra as String;
          return SearchResultScreen(query: query);
        },
      ),
      GoRoute(
        path: AppRoutes.articlesDetailsScreen,
        name: AppRoutes.articlesDetailsScreen,
        builder: (context, state) {
          Article article = state.extra as Article;
          return ArticlesDetailsScreen(article: article);
        },
      ),
    ],
  );
}

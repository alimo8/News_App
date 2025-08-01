import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:n_news_app/core/constants/constants.dart';
import 'package:n_news_app/core/styles/app_text_styles.dart';
import 'package:n_news_app/core/widgets/spacing_widgets.dart';
import 'package:n_news_app/features/home_screen/models/top_headlines_model.dart';
import 'package:n_news_app/features/home_screen/widget/articl_card_widget.dart';
import 'package:n_news_app/features/search_result_screen/services/search_result_services.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key, required this.query});
  final String query;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('search_result'.tr(), style: AppTextStyles.black14Medium),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              if (context.locale.languageCode == 'en') {
                context.setLocale(Locale('ar'));
              } else {
                context.setLocale(Locale('ar'));
              }
              AppConstants.lang == context.locale.languageCode;
            },
            icon: Icon(Icons.language, color: Colors.black),
          ),
        ],
      ),
      body: FutureBuilder(
        future: SearchResultServices().searchItemByName(query),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          }
          if (asyncSnapshot.hasError) {
            return Center(
              child: Text('Error: ${asyncSnapshot.error.toString()}'),
            );
          }

          if (asyncSnapshot.hasData) {
            ArticlesModels topHeadlinesModel =
                asyncSnapshot.data! as ArticlesModels;
            if (topHeadlinesModel.totalResults == 0) {
              return Center(child: Text('no_results'.tr()));
            }
            return Column(
              children: [
                HeightSpace(24),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),

                    child: ListView.builder(
                      itemCount: topHeadlinesModel.articles!.length,
                      itemBuilder: (context, index) {
                        Article article = topHeadlinesModel.articles![index];
                        return ArticlCardWidget(article: article);
                      },
                    ),
                  ),
                ),
              ],
            );
          }
          return Center(child: Text('Something went wrong'));
        },
      ),
    );
  }
}

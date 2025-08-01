import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:n_news_app/core/constants/constants.dart';
import 'package:n_news_app/core/routing/app_routes.dart';
import 'package:n_news_app/core/styles/app_text_styles.dart';
import 'package:n_news_app/core/widgets/spacing_widgets.dart';
import 'package:n_news_app/features/home_screen/models/top_headlines_model.dart';
import 'package:n_news_app/features/home_screen/services/home_screen_services.dart';
import 'package:n_news_app/features/home_screen/widget/articl_card_widget.dart';
import 'package:n_news_app/features/home_screen/widget/custom_category_item_widget.dart';
import 'package:n_news_app/features/home_screen/widget/search_text_field_widget.dart';
import 'package:n_news_app/features/home_screen/widget/top_headline_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    HomeScreenServices().getTopHeadLineArticle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffE9EEFA),
        toolbarHeight: 120.h,
        title: Text('explore'.tr(), style: AppTextStyles.titleStyle),
        actions: [
          SearchTextFieldWidget(),
          // IconButton(
          //   onPressed: () {
          //     if (context.locale.languageCode == 'en') {
          //       context.setLocale(Locale('ar'));
          //     } else {
          //       context.setLocale(Locale('ar'));
          //     }
          //     AppConstants.lang == context.locale.languageCode;
          //   },
          //   icon: Icon(Icons.language, color: Colors.black),
          // ),
        ],
      ),
      body: FutureBuilder(
        future: HomeScreenServices().getTopHeadLineArticle(),
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
                HeightSpace(16),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 32.w),

                  child: SizedBox(
                    height: 50.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      children: [
                        CustomCategoryItemWidget(
                          onTap: () {
                            GoRouter.of(context).pushNamed(
                              AppRoutes.searchResultScreen,
                              extra: 'travel'.tr(),
                            );
                          },
                          title: 'travel'.tr(),
                        ),
                        CustomCategoryItemWidget(
                          onTap: () {
                            GoRouter.of(context).pushNamed(
                              AppRoutes.searchResultScreen,
                              extra: 'technology'.tr(),
                            );
                          },
                          title: 'technology'.tr(),
                        ),
                        CustomCategoryItemWidget(
                          onTap: () {
                            GoRouter.of(context).pushNamed(
                              AppRoutes.searchResultScreen,
                              extra: 'business'.tr(),
                            );
                          },
                          title: 'business'.tr(),
                        ),
                        CustomCategoryItemWidget(
                          title: 'entertainment'.tr(),
                          onTap: () {
                            GoRouter.of(context).pushNamed(
                              AppRoutes.searchResultScreen,
                              extra: 'entertainment'.tr(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                HeightSpace(24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: [
                      TopHeadlineItemWidget(
                        imageUrl: topHeadlinesModel.articles![0].urlToImage,
                        title: topHeadlinesModel.articles![0].title ?? '',
                        autherName: topHeadlinesModel.articles![0].author ?? '',
                        date: DateFormat(
                          'yyyy-MM-dd - kk:mm',
                        ).format(topHeadlinesModel.articles![0].publishedAt!),
                      ),
                    ],
                  ),
                ),
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

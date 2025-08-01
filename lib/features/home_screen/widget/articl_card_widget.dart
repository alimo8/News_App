import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:n_news_app/core/routing/app_routes.dart';
import 'package:n_news_app/core/styles/app_text_styles.dart';
import 'package:n_news_app/core/widgets/spacing_widgets.dart';
import 'package:n_news_app/features/home_screen/models/top_headlines_model.dart';

class ArticlCardWidget extends StatelessWidget {
  const ArticlCardWidget({super.key, required this.article});

  final Article article;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(
          context,
        ).pushNamed(AppRoutes.articlesDetailsScreen, extra: article);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                SizedBox(
                  width: 238.w,
                  child: Text(
                    article.title ?? '',
                    maxLines: 2,
                    style: AppTextStyles.titleStyle.copyWith(fontSize: 18.sp),
                  ),
                ),
                HeightSpace(8),
                SizedBox(
                  width: 238.w,
                  child: Text(
                    '${article.author} - ${article.publishedAt}',
                    style: AppTextStyles.grey14Regular,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 112.w,
              height: 80.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: CachedNetworkImage(
                  errorWidget: (context, url, error) =>
                      Icon(Icons.error, color: Colors.red),
                  imageUrl:
                      article.urlToImage ??
                      "https://media.gettyimages.com/id/1673064753/vector/breaking-news-world-map-background.jpg?s=612x612&w=gi&k=20&c=xqtMzWHNfVcQHeZosiHAWKJS0QuUtgbZUKJjBlkirBA=",
                  height: 206.h,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:n_news_app/core/styles/app_text_styles.dart';
import 'package:n_news_app/core/widgets/spacing_widgets.dart';
import 'package:n_news_app/features/home_screen/models/top_headlines_model.dart';

class ArticlesDetailsScreen extends StatelessWidget {
  const ArticlesDetailsScreen({super.key, required this.article});
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .8,

        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl:
                  article.urlToImage ??
                  "https://media.gettyimages.com/id/1673064753/vector/breaking-news-world-map-background.jpg?s=612x612&w=gi&k=20&c=xqtMzWHNfVcQHeZosiHAWKJS0QuUtgbZUKJjBlkirBA=",
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 200.h,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .8,
                padding: EdgeInsets.only(top: 24.h, left: 24.w, right: 24.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24.r),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.title ?? '',
                        style: AppTextStyles.titleStyle.copyWith(
                          fontSize: 18.sp,
                        ),
                      ),
                      HeightSpace(10),
                      Text(
                        '${article.author} - ${DateFormat('yyyy-MM-dd - kk:mm').format(article.publishedAt!)}',
                        style: AppTextStyles.grey14Regular,
                      ),
                      HeightSpace(24),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 9,
                        child: Text(
                          article.description.toString(),
                          style: AppTextStyles.grey14Regular,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

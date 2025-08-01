import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:n_news_app/core/styles/app_text_styles.dart';
import 'package:n_news_app/core/widgets/spacing_widgets.dart';

class TopHeadlineItemWidget extends StatelessWidget {
  const TopHeadlineItemWidget({
    super.key,
    required this.title,
    required this.autherName,
    required this.date,
    this.imageUrl,
  });
  final String title;
  final String autherName;
  final String date;
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CachedNetworkImage(
              imageUrl:
                  imageUrl ??
                  "https://media.gettyimages.com/id/1673064753/vector/breaking-news-world-map-background.jpg?s=612x612&w=gi&k=20&c=xqtMzWHNfVcQHeZosiHAWKJS0QuUtgbZUKJjBlkirBA=",
              height: 206.h,
              fit: BoxFit.fill,
            ),
          ),
        ),
        HeightSpace(16),
        Text(title, style: AppTextStyles.titleStyle.copyWith(fontSize: 18.sp)),
        HeightSpace(8),
        Text('$autherName - $date', style: AppTextStyles.grey14Regular),
      ],
    );
  }
}

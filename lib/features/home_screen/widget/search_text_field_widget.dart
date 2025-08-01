import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:n_news_app/core/routing/app_routes.dart';
import 'package:n_news_app/core/widgets/custom_text_field.dart';

class SearchTextFieldWidget extends StatefulWidget {
  const SearchTextFieldWidget({super.key});

  @override
  State<SearchTextFieldWidget> createState() => _SearchTextFieldWidgetState();
}

class _SearchTextFieldWidgetState extends State<SearchTextFieldWidget> {
  bool showTextField = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        showTextField
            ? CustomTextField(
                width: 200.w,
                hintText: 'search'.tr(),
                onFieldSubmitted: (value) {
                  GoRouter.of(
                    context,
                  ).pushNamed(AppRoutes.searchResultScreen, extra: value);
                },
              )
            : SizedBox.shrink(),
        IconButton(
          onPressed: () {
            setState(() {
              showTextField = !showTextField;
            });
          },
          icon: Icon(Icons.search),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ProfileCardRowText extends StatelessWidget {
  const ProfileCardRowText({
    super.key,
    required this.title,
    required this.userInfoText,
  });

  final String title;
  final String userInfoText;

  @override
  Widget build(BuildContext context) {
    var isSmallThanDesktop =
        ResponsiveWrapper.of(context).isSmallerThan(DESKTOP);
    return ResponsiveRowColumn(
      layout: ResponsiveRowColumnType.ROW,
      columnCrossAxisAlignment: CrossAxisAlignment.start,
      columnMainAxisAlignment: MainAxisAlignment.center,
      rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ResponsiveRowColumnItem(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: isSmallThanDesktop ? 20 : 40,
                ),
          ),
        ),
        ResponsiveRowColumnItem(
          child: SizedBox(
            width: isSmallThanDesktop ? 15 : 40,
          ),
        ),
        ResponsiveRowColumnItem(
          child: Text(
            userInfoText,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: isSmallThanDesktop ? 20 : 45,
                ),
          ),
        ),
      ],
    );
  }
}

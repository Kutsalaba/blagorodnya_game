import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_row_column.dart';

class FreeInfoWidget extends StatelessWidget {
  const FreeInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var isSmallThanDesktop =
        ResponsiveWrapper.of(context).isSmallerThan(DESKTOP);
    return ResponsiveRowColumn(
      layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
          ? ResponsiveRowColumnType.COLUMN
          : ResponsiveRowColumnType.ROW,
      rowCrossAxisAlignment: CrossAxisAlignment.start,
      columnCrossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ResponsiveRowColumnItem(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isSmallThanDesktop ? 20 : 40,
              vertical: isSmallThanDesktop ? 20 : 40,
            ),
            child: CircleAvatar(
              radius: isSmallThanDesktop ? 50 : 100,
              backgroundImage: const NetworkImage(
                  'https://media.istockphoto.com/id/1322277517/photo/wild-grass-in-the-mountains-at-sunset.jpg?s=612x612&w=0&k=20&c=6mItwwFFGqKNKEAzv0mv6TaxhLN3zSE43bWmFN--J5w='),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
        ResponsiveRowColumnItem(
          child: SizedBox(
            width: isSmallThanDesktop ? 20 : 30,
          ),
        ),
      ],
    );
  }
}

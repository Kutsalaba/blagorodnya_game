import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class FreeInfoWidget extends StatelessWidget {
  const FreeInfoWidget({
    super.key,
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    var isSmallThanDesktop =
        ResponsiveWrapper.of(context).isSmallerThan(DESKTOP);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isSmallThanDesktop ? 20 : 40,
        vertical: isSmallThanDesktop ? 20 : 40,
      ),
      child: ResponsiveRowColumn(
        layout: ResponsiveRowColumnType.COLUMN,
        rowCrossAxisAlignment: CrossAxisAlignment.center,
        columnCrossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ResponsiveRowColumnItem(
            child: CircleAvatar(
              radius: isSmallThanDesktop ? 50 : 100,
              backgroundImage: const NetworkImage(
                  'https://t4.ftcdn.net/jpg/02/29/75/83/360_F_229758328_7x8jwCwjtBMmC6rgFzLFhZoEpLobB6L8.jpg'),
              backgroundColor: Colors.transparent,
            ),
          ),
          ResponsiveRowColumnItem(
            child: SizedBox(
              width: isSmallThanDesktop ? 20 : 30,
            ),
          ),
          ResponsiveRowColumnItem(
            child: Text(
              email,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: isSmallThanDesktop ? 20 : 35,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

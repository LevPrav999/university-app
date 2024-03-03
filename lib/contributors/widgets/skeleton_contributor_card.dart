import 'package:flutter/material.dart';
import 'package:rtu_mirea_app/presentation/theme.dart';
import 'package:rtu_mirea_app/presentation/widgets/skeleton.dart';

class SkeletonContributorCard extends StatelessWidget {
  const SkeletonContributorCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 37,
              backgroundColor: AppTheme.colors.deactive,
            ),
            const SizedBox(height: 16),
            Container(
              width: 100,
              height: 16,
              color: AppTheme.colors.background03,
            ),
            const SizedBox(height: 8),
            Container(
              width: 100,
              height: 16,
              color: AppTheme.colors.background03,
            ),
          ],
        ),
      ),
    );
  }
}

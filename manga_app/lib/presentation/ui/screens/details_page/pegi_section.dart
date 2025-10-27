import 'package:flutter/material.dart';
import 'package:manga_app/presentation/ui/theme/app_colors.dart';
import 'package:manga_app/presentation/ui/theme/app_text_style.dart';

class PegiSection extends StatelessWidget {
  const PegiSection({super.key, required this.rating});

  final int rating;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textStyle = Theme.of(context).extension<AppTextStyle>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(12, 8, 20, 8),
          margin: const EdgeInsets.fromLTRB(12, 0, 0, 4),
          transform: Matrix4.skewX(-.3),
          decoration: BoxDecoration(
            color: colors.primaryColor.withValues(alpha: 0.4),
          ),
          child: Container(
            transform: Matrix4.skewX(.3),
            child: Text(
              '+$rating',

              style: textStyle.body.copyWith(
                color: Theme.of(context).extension<AppColors>()?.textSecondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

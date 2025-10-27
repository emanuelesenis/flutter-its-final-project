import 'package:flutter/material.dart';
import 'package:manga_app/presentation/ui/theme/app_colors.dart';
import 'package:manga_app/presentation/ui/theme/app_text_style.dart';

class Tag extends StatelessWidget {
  final String label;

  const Tag({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textStyle = Theme.of(context).extension<AppTextStyle>()!;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: colors.primaryColor.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colors.primaryColor.withValues(alpha: 0.5)),
      ),
      child: Text(
        label,
        style: textStyle.body.copyWith(
          color: colors.primaryColor,
          fontSize: 14,
        ),
      ),
    );
  }
}

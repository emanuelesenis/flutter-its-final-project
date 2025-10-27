import 'package:flutter/material.dart';
import 'package:manga_app/presentation/ui/screens/details_page/tag.dart';
import 'package:manga_app/presentation/ui/theme/app_colors.dart';
import 'package:manga_app/presentation/ui/theme/app_text_style.dart';

class TagsSection extends StatelessWidget {
  final List<String> tags;

  const TagsSection({super.key, required this.tags});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textStyle = Theme.of(context).extension<AppTextStyle>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'TAG',
          style: textStyle.h3.copyWith(
            color: colors.textPrimary,
            fontWeight: FontWeight.normal,
            fontFamily: 'Aboreto',
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: tags.map((tag) => Tag(label: tag)).toList(),
        ),
      ],
    );
  }
}

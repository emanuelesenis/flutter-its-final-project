import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:go_router/go_router.dart';
import 'package:manga_app/presentation/ui/theme/app_colors.dart';

class CustomFab extends StatelessWidget {
  const CustomFab({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;

    return ExpandableFab(
      distance: 64,
      openButtonBuilder: RotateFloatingActionButtonBuilder(
        child: const Icon(Icons.account_circle_outlined),
        fabSize: ExpandableFabSize.regular,
        foregroundColor: Colors.white,
        backgroundColor: colors.primaryColor,
        shape: const CircleBorder(),
      ),
      closeButtonBuilder: DefaultFloatingActionButtonBuilder(
        child: const Icon(Icons.close),
        fabSize: ExpandableFabSize.small,
        foregroundColor: Colors.white,
        backgroundColor: colors.secondaryColor,
        shape: const CircleBorder(),
      ),
      children: [
        FloatingActionButton.small(
          heroTag: "favoritesButton",
          onPressed: () {
            context.push('/favorites');
          },
          foregroundColor: Colors.white,
          child: const Icon(Icons.favorite_border),
        ),
        FloatingActionButton.small(
          heroTag: "profileButton",
          onPressed: () {},
          foregroundColor: Colors.white,
          child: const Icon(Icons.account_circle_outlined),
        ),
      ],
    );
  }
}

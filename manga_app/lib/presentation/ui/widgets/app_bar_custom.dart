import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:manga_app/presentation/ui/theme/app_colors.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  final bool showSearch; // controllo visibilità icona di ricerca
  final VoidCallback? onSearch; // callback per il pulsante search

  const AppBarHome({super.key, this.showSearch = true, this.onSearch});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: SvgPicture.asset(
          'assets/icons/app_logo.svg',
          width: 24,
          height: 24,
        ),
      ),
      actions: [
        if (showSearch)
          IconButton(
            icon: Icon(Icons.search, color: colors.textSecondary, size: 32),
            onPressed: onSearch,
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

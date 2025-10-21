import 'package:flutter/material.dart';
import 'package:manga_app/presentation/ui/theme/app_colors.dart';
import 'package:manga_app/presentation/ui/theme/theme_extensions.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;

  const CustomAppBar({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 140, // Aumenta l'altezza dell'AppBar
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 245, 245, 0.9),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(80),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment:
                  CrossAxisAlignment.end, // Allinea i contenuti a destra
              children: [
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // Sposta leading e titolo
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.brown),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Expanded(
                      child: Text(
                        title,
                        style: context.textStyles.h1.copyWith(
                          color: Theme.of(
                            context,
                          ).extension<AppColors>()!.primaryColor,
                        ),
                        textAlign: TextAlign.right, // Allinea il testo a destra
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: context.textStyles.h4.copyWith(
                    fontSize: 16,
                    color: Theme.of(
                      context,
                    ).extension<AppColors>()!.primaryColor,
                  ),
                  textAlign: TextAlign.right, // Allinea il sottotitolo a destra
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(130); // Altezza personalizzata
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:manga_app/presentation/ui/screens/login_registration/tutorial/tutorial_swiper.dart';
import 'package:manga_app/presentation/ui/theme/app_colors.dart';
import 'package:manga_app/presentation/ui/theme/theme_extensions.dart'; // Import per AppColors

class TutorialScreen extends StatelessWidget {
  const TutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          TutorialSwiper(
            imagePaths: [
              'assets/images/tutorial1.png',
              'assets/images/tutorial2.png',
              'assets/images/tutorial3.png',
            ],
            titles: [
              'Immergiti nelle tue storie preferite con un\'esperienza di lettura veloce e senza interruzioni.',
              'Esplora un vasto catalogo di opere: trova scan aggiornate e scegli il titolo che più ti ispira.',
              'Accedi facilmente all\'elenco dei capitoli e riprendi sempre la lettura da dove l\'hai lasciata.',
            ],
          ),
          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: false,
              title: SvgPicture.asset(
                'assets/icons/app_logo.svg',
                width: 32,
                height: 32,
              ),
            ),
            backgroundColor: Colors.transparent,

            bottomNavigationBar: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 245, 245, 0.9),
                borderRadius: BorderRadius.only(topRight: Radius.circular(80)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 48),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Pulsante LOGIN
                    ElevatedButton(
                      onPressed: () {
                        context.push('/login');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context)
                            .extension<AppColors>()!
                            .primaryColor, // Usa il colore primary
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'LOGIN',
                          style: context.textStyles.h4.copyWith(
                            fontSize: 16,
                            color: Theme.of(
                              context,
                            ).extension<AppColors>()!.textSecondary,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () {
                        context.push('/registration');
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero, // Rimuove il padding
                        minimumSize: Size.zero, // Rimuove la dimensione minima
                        tapTargetSize: MaterialTapTargetSize
                            .shrinkWrap, // Riduce l'area cliccabile
                      ),
                      child: Text(
                        'O crea un account →',
                        style: TextStyle(
                          color: Theme.of(
                            context,
                          ).extension<AppColors>()!.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

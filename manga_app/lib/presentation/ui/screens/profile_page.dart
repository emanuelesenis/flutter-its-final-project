import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:manga_app/bloc/auth/auth_bloc.dart';
import 'package:manga_app/bloc/auth/auth_event.dart';
import 'package:manga_app/firebase/firebase_auth_service.dart';
import 'package:manga_app/presentation/ui/screens/login_registration/custom_app_bar.dart';
import 'package:manga_app/presentation/ui/theme/app_colors.dart';
import 'package:manga_app/presentation/ui/theme/theme_extensions.dart';
import 'package:manga_app/presentation/ui/widgets/badge_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //IMMAGINE DI SFONDO
        Positioned.fill(
          child: Image.asset('assets/images/profilo.png', fit: BoxFit.cover),
        ),

        Scaffold(
          backgroundColor: Colors
              .transparent, //TRASPARENTE COSÌ NON COPRE L'IMMAGINE NELL'ANGOLO CURVO
          //CUSTOM APP BAR
          appBar: CustomAppBar(
            title: "Profile",
            subtitle: "Check your account details",
          ),

          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),

                // NICKNAME Section
                Center(
                  child: Text(
                    'NICKNAME',
                    style: context.textStyles.h2.copyWith(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // BADGES Section
                Text(
                  'Badges',
                  style: context.textStyles.h3.copyWith(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 16),

                // Grid di badge
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    BadgeWidget(
                      badgeName: 'Badge 1',
                      icon: Icons.star,
                      isUnlocked: true,
                      description: 'First achievement unlocked',
                    ),
                    BadgeWidget(
                      badgeName: 'Badge 2',
                      icon: Icons.favorite,
                      isUnlocked: true,
                      description: 'Love for manga',
                    ),
                    BadgeWidget(
                      badgeName: 'Badge 3',
                      icon: Icons.book,
                      isUnlocked: false,
                      description: 'Read 100 chapters',
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // LA MIA LISTA Section
                Text(
                  'La mia lista',
                  style: context.textStyles.h3.copyWith(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                // IMPOSTAZIONI Section
                Text(
                  'Impostazioni',
                  style: context.textStyles.h3.copyWith(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 40),

                // LOGOUT Button
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuthService().signOut();
                        GoRouter.of(context).go('/login');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFB08080),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Logout',
                        style: context.textStyles.h4.copyWith(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

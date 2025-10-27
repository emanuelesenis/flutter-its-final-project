import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:manga_app/firebase/firebase_auth_service.dart';
import 'package:manga_app/presentation/ui/screens/login_registration/custom_app_bar.dart';
import 'package:manga_app/presentation/ui/widgets/badge_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? userNickname;
  String? userEmail;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  // Metodo per caricare i dati dell'utente
  void _loadUserData() {
    final User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      setState(() {
        userEmail = currentUser.email;
        userNickname =
            currentUser.displayName ??
            currentUser.email?.split('@').first ??
            'User';
      });
    } else {
      // Se non c'è utente loggato, mostra valori di default
      setState(() {
        userNickname = 'Guest';
        userEmail = 'Not logged in';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //IMMAGINE DI SFONDO
        Positioned.fill(
          child: Image.asset('assets/images/profilo.png', fit: BoxFit.cover),
        ),

        Scaffold(
          backgroundColor: Colors.transparent,
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
                  child: Column(
                    children: [
                      Text(
                        userNickname ?? 'Loading...',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          //letterSpacing: 1.2,
                          shadows: [
                            Shadow(
                              offset: Offset(1.0, 1.0),
                              blurRadius: 3.0,
                              color: Colors.black45,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      if (userEmail != null)
                        Text(
                          userEmail!,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                // BADGES Section
                const Text(
                  'Badges',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 16),

                // Grid di badge
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
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

                // MY LIST Section
                const Text(
                  'My list',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                // SETTINGS Section
                const Text(
                  'Settings',
                  style: TextStyle(
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
                      child: const Text(
                        'Logout',
                        style: TextStyle(
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

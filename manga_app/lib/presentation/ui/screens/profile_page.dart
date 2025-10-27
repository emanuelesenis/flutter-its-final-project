import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:manga_app/bloc/auth/auth_bloc.dart';
import 'package:manga_app/bloc/auth/auth_event.dart';
import 'package:manga_app/presentation/ui/screens/login_registration/custom_app_bar.dart';
import 'package:manga_app/presentation/ui/theme/app_colors.dart';
import 'package:manga_app/presentation/ui/theme/theme_extensions.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();

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
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
            child: Column(
              children: [
                const SizedBox(height: 64),
                // Form di login
                Column(children: [const SizedBox(height: 30)]),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

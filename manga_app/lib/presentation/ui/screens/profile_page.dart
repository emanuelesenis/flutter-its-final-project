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
            title: "Login",
            subtitle: "Hai già un account? Inserisci i tuoi dati",
          ),

          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
            child: Column(
              children: [
                const SizedBox(height: 64),
                // Form di login
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      /*SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthBloc>().add(
                                LoginRequest(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(
                              context,
                            ).extension<AppColors>()!.primaryColor,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
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
                      ),*/
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Link per registrarsi
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Non hai un account?', style: context.textStyles.body),
                    TextButton(
                      onPressed: () {
                        context.push('/registration');
                      },
                      child: Text(
                        'REGISTRATI',
                        style: context.textStyles.body.copyWith(
                          color: Theme.of(
                            context,
                          ).extension<AppColors>()!.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

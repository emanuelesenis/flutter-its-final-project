import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manga_app/bloc/auth/auth_bloc.dart';
import 'package:manga_app/bloc/auth/auth_event.dart';
import 'package:manga_app/presentation/ui/screens/home_page.dart';
import 'package:manga_app/presentation/ui/screens/login_registration/custom_app_bar.dart';
import 'package:manga_app/presentation/ui/theme/app_colors.dart';
import 'package:manga_app/presentation/ui/theme/theme_extensions.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/registrazione.png',
            fit: BoxFit.cover,
          ),
        ),

        Scaffold(
          backgroundColor: Colors.transparent,

          appBar: CustomAppBar(
            title: "Registrazione",
            subtitle: "Inserisci i dati richiesti per completare l'iscrizione",
          ),

          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Nome',
                          prefixIcon: const Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          fillColor: const Color.fromRGBO(255, 245, 245, 0.9),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Inserisci il tuo nome';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: const Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          fillColor: const Color.fromRGBO(255, 245, 245, 0.9),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Inserisci l\'email';
                          }
                          final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                          if (!emailRegex.hasMatch(value)) {
                            return 'Inserisci un\'email valida';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: const Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          fillColor: const Color.fromRGBO(255, 245, 245, 0.9),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Inserisci una password';
                          }
                          if (value.length < 6) {
                            return 'La password deve contenere almeno 6 caratteri';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Conferma Password',
                          prefixIcon: const Icon(Icons.lock_outline),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          fillColor: const Color.fromRGBO(255, 245, 245, 0.9),
                        ),
                        validator: (value) {
                          if (value != _passwordController.text) {
                            return 'Le password non coincidono';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthBloc>().add(
                                RegisterRequest(
                                  username: _nameController.text,
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ),
                              );
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
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
                            'REGISTRATI',
                            style: context.textStyles.h4.copyWith(
                              fontSize: 16,
                              color: Theme.of(
                                context,
                              ).extension<AppColors>()!.textSecondary,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Hai già un account?',
                            style: context.textStyles.body,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'ACCEDI',
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}

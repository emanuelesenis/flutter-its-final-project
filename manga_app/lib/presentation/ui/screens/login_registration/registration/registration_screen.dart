import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manga_app/presentation/ui/theme/app_colors.dart'; // Import per AppColors

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //TODO: custom appbar,
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your email',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your password',
            ),
            obscureText: true,
          ),
        ],
      ),
    );
  }
}

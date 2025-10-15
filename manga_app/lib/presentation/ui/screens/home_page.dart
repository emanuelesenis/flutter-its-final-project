import 'package:flutter/material.dart';
import 'package:manga_app/presentation/ui/theme/app_colors.dart';
import 'package:manga_app/presentation/ui/theme/app_text_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    // Recuperiamo i colori e gli stili dal tema
    final colors = Theme.of(context).extension<AppColors>()!;
    final style = Theme.of(context).extension<AppTextStyle>()!;

    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: style.h2),
        backgroundColor: colors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Titolo principale (h1)", style: style.h1),
            const SizedBox(height: 8),
            Text("Sottotitolo (h2)", style: style.h2),
            const SizedBox(height: 8),
            Text("Sezione (h3)", style: style.h3),
            const SizedBox(height: 8),
            Text("Testo secondario (h4)", style: style.h4),
            const SizedBox(height: 16),
            Text(
              "Questo è un testo body per testare i paragrafi lunghi.",
              style: style.body,
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.primaryColor,
                  foregroundColor: colors.textPrimary,
                ),
                onPressed: () {},
                child: const Text("Bottone di test"),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

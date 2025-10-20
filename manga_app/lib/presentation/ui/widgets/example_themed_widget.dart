import 'package:flutter/material.dart';
import '../theme/theme_extensions.dart';

/// Esempio di widget che usa le estensioni del tema
class ExampleThemedWidget extends StatelessWidget {
  const ExampleThemedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: context.colors.backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.colors.primaryColor, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Titolo principale
          Text('Titolo Principale', style: context.textStyles.h1),
          const SizedBox(height: 8),

          // Sottotitolo
          Text('Sottotitolo Secondario', style: context.textStyles.h2),
          const SizedBox(height: 16),

          // Contenuto con stile h3
          Text('Contenuto importante', style: context.textStyles.h3),
          const SizedBox(height: 8),

          // Testo normale con stile h4
          Text('Testo normale più piccolo', style: context.textStyles.h4),
          const SizedBox(height: 16),

          // Testo del corpo
          Text(
            'Questo è un testo del corpo che utilizza lo stile body del tema. '
            'Mostra come il testo secondario viene renderizzato con i colori personalizzati.',
            style: context.textStyles.body,
          ),
          const SizedBox(height: 16),

          // Bottone di esempio
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Tema ${context.isDarkMode ? "Scuro" : "Chiaro"} attivo!',
                    style: context.textStyles.body.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: context.colors.primaryColor,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: context.colors.primaryColor,
              foregroundColor: context.colors.textSecondary,
            ),
            child: Text(
              'Test Tema',
              style: context.textStyles.h4.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
          ),

          // Info sulle dimensioni dello schermo
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: context.colors.secondaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Info Schermo:',
                  style: context.textStyles.h4.copyWith(
                    color: context.colors.textPrimary,
                  ),
                ),
                Text(
                  'Larghezza: ${context.screenWidth.toStringAsFixed(0)}px',
                  style: context.textStyles.body.copyWith(
                    color: context.colors.textPrimary,
                  ),
                ),
                Text(
                  'Altezza: ${context.screenHeight.toStringAsFixed(0)}px',
                  style: context.textStyles.body.copyWith(
                    color: context.colors.textPrimary,
                  ),
                ),
                Text(
                  'Modalità: ${context.isDarkMode ? "Scura" : "Chiara"}',
                  style: context.textStyles.body.copyWith(
                    color: context.colors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

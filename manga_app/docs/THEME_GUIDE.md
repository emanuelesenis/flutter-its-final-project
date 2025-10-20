# Guida all'Implementazione del Tema

## Struttura del Sistema di Temi

Il sistema di temi è organizzato in 4 file principali nella cartella `lib/presentation/ui/theme/`:

### 1. `app_colors.dart`

Definisce tutti i colori per tema chiaro e scuro:

- `AppColors.light()` - Colori per il tema chiaro
- `AppColors.dark()` - Colori per il tema scuro

### 2. `app_text_style.dart`

Definisce gli stili di testo:

- `h1` - Aboreto 30px
- `h2` - Aboreto 24px  
- `h3` - Montserrat 20px
- `h4` - Montserrat 16px
- `body` - Montserrat 16px

### 3. `app_theme.dart`

Contiene la configurazione principale del tema e i metodi helper per accedere ai colori e stili in modo sicuro.

### 4. `theme_extensions.dart` ⭐ **NUOVO**

Estensioni per semplificare l'accesso al tema.

## Come Usare il Tema

### Metodo 1: Estensioni (Raccomandato) ⭐

```dart
import 'package:flutter/material.dart';
import '../theme/theme_extensions.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colors.backgroundColor,
      child: Column(
        children: [
          Text(
            'Titolo',
            style: context.textStyles.h1,
          ),
          Text(
            'Sottotitolo',
            style: context.textStyles.h2,
          ),
          Text(
            'Contenuto',
            style: context.textStyles.body,
          ),
        ],
      ),
    );
  }
}
```

### Metodo 2: Helper methods (Alternativo)

```dart
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = AppThemeData.colorsOf(context);
    final textStyles = AppThemeData.textStyleOf(context);
    
    return Container(
      color: colors.backgroundColor,
      child: Text(
        'Testo',
        style: textStyles.h1,
      ),
    );
  }
}
```

## Proprietà Disponibili

### Colori (`context.colors`)

- `primaryColor` - Colore primario dell'app
- `secondaryColor` - Colore secondario
- `backgroundColor` - Sfondo principale
- `textPrimary` - Testo principale
- `textSecondary` - Testo secondario
- `imageOverlay` - Overlay per immagini

### Stili di Testo (`context.textStyles`)

- `h1` - Titoli principali (Aboreto 30px)
- `h2` - Titoli secondari (Aboreto 24px)
- `h3` - Titoli minori (Montserrat 20px)
- `h4` - Sottotitoli (Montserrat 16px)
- `body` - Testo del corpo (Montserrat 16px)

### Utility (`context`)

- `isDarkMode` - Verifica se è attivo il tema scuro
- `isLightMode` - Verifica se è attivo il tema chiaro
- `screenWidth` - Larghezza dello schermo
- `screenHeight` - Altezza dello schermo
- `screenSize` - Dimensioni complete dello schermo

## Personalizzazione degli Stili

Puoi personalizzare qualsiasi stile usando `copyWith()`:

```dart
Text(
  'Testo personalizzato',
  style: context.textStyles.h1.copyWith(
    color: Colors.red,
    fontWeight: FontWeight.bold,
  ),
)
```

## Configurazione nell'App

Il tema è già configurato in `my_app.dart`:

```dart
MaterialApp(
  theme: appTheme(dark: false),        // Tema chiaro
  darkTheme: appTheme(dark: true),     // Tema scuro
  themeMode: ThemeMode.system,         // Segue le impostazioni di sistema
  // ...
)
```

## Cambio Tema Dinamico

Per implementare un toggle per cambiare tema:

```dart
// Usando Provider o altro state management
class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  
  ThemeMode get themeMode => _themeMode;
  
  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.dark 
        ? ThemeMode.light 
        : ThemeMode.dark;
    notifyListeners();
  }
}
```

## Esempi Pratici

Vedi `example_themed_widget.dart` per un esempio completo che mostra tutti gli stili e colori disponibili.

## Best Practices

1. ⭐ **Usa sempre le estensioni** per accesso rapido al tema
2. 🎨 **Non hardcodare mai i colori** - usa sempre `context.colors`
3. 📝 **Non hardcodare mai gli stili di testo** - usa sempre `context.textStyles`
4. 🔄 **Testa sempre entrambi i temi** (chiaro e scuro)
5. 📱 **Usa le utility per dimensioni responsive** (`context.screenWidth`, etc.)

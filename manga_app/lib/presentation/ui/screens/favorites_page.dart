import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FAVORITES',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.brown,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(255, 245, 245, 0.9),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.brown),
          onPressed: () {
            Navigator.of(context).pop(); // Torna indietro
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Campo di ricerca
            TextField(
              decoration: InputDecoration(
                hintText: 'Scrivi un titolo...',
                prefixIcon: const Icon(Icons.search, color: Colors.brown),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.brown),
                ),
                filled: true,
                fillColor: const Color.fromRGBO(255, 245, 245, 0.9),
              ),
            ),
            const SizedBox(height: 16),
            // Sezione filtri
            const Text(
              'FILTRI',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                Chip(
                  label: const Text('Sport'),
                  backgroundColor: const Color.fromRGBO(255, 245, 245, 0.9),
                  labelStyle: const TextStyle(color: Colors.brown),
                ),
                Chip(
                  label: const Text('Azione'),
                  backgroundColor: const Color.fromRGBO(255, 245, 245, 0.9),
                  labelStyle: const TextStyle(color: Colors.brown),
                ),
                Chip(
                  label: const Text('Fantasy'),
                  backgroundColor: const Color.fromRGBO(255, 245, 245, 0.9),
                  labelStyle: const TextStyle(color: Colors.brown),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Lista dei preferiti
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.7,
                ),
                itemCount: 6, // Numero di elementi
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                            child: Image.asset(
                              'assets/images/registrazione.png', // Sostituisci con il percorso corretto
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Titolo Manga',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Cap 1',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.brown,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
